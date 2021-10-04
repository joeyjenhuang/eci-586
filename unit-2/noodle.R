

library(tidymodels)
library(tidyverse)
library(skimr)

sci_mo_with_text <- read_csv("unit-2/data/sci-mo-with-text.csv")

glimpse(sci_mo_with_text)

course_data <- 
  sci_mo_with_text |>
  mutate(pass_fail = ifelse(final_grade >= 66.7, "pass", "fail")) |>
  select(student_id, # student
         pass_fail, # outcom
         #predictors 
         int, uv, pc, time_spent, final_grade, subject, enrollment_reason, semester, enrollment_status, cogproc, social, posemo, negemo, n) |>
  na.omit() |>
  mutate_if(is.character, as.factor)



course_data

course_data |>
  count(pass_fail) |>
  mutate(prop = n/sum(n))


skim(course_data)

course_data <- 
  sci_mo_with_text |>
  mutate(pass_fail = ifelse(final_grade >= 66.7, "pass", "fail")) |>
  select(student_id, # student
         pass_fail, # outcome
         #predictors 
         int, uv, pc, time_spent, subject, enrollment_reason, semester, cogproc, social, posemo, negemo, n) |>
  na.omit() |>
  mutate_if(is.character, as.factor)

## Split data ####

course_split <- initial_split(course_data, prop = 3/4)

course_split

## Create data frames for the two sets:
train_data <- training(course_split)
test_data  <- testing(course_split)

train_data
test_data

## Recipes ####

course_recipe <- 
  recipe(pass_fail ~ ., data = train_data) 

course_recipe

summary(course_recipe)

### add role ####
course_recipe <- 
  recipe(pass_fail ~ ., data = train_data) |>
  update_role(student_id, new_role = "ID") 

course_recipe

summary(course_recipe)

### create dummy variables ####
course_recipe <- 
  recipe(pass_fail ~ ., data = train_data) |> 
  update_role(student_id, new_role = "ID") |>
  step_dummy(all_nominal_predictors())

course_recipe

summary(course_recipe)


### remove "zero-variance" predictors ####
course_recipe <- 
  recipe(pass_fail ~ ., data = train_data) |> 
  update_role(student_id, new_role = "ID") |>
  step_dummy(all_nominal_predictors()) |>
  step_zv(all_predictors())

course_recipe

summary(course_recipe)


## Fit a Model ####

lr_mod <- 
  logistic_reg() %>% 
  set_engine("glm")


lr_workflow <- 
  workflow() %>% 
  add_model(lr_mod) %>% 
  add_recipe(course_recipe)

lr_fit <- 
  lr_workflow %>% 
  fit(data = train_data)

lr_fit %>% 
  extract_fit_parsnip() %>% 
  tidy()

predict(lr_fit, test_data)

course_aug <- 
  augment(lr_fit, test_data)

course_aug

# The data look like: 
course_aug %>%
  select(student_id, pass_fail, .pred_class, .pred_pass)

course_aug %>% 
  roc_curve(truth = pass_fail, .pred_fail) %>% 
  autoplot()

course_aug %>% 
  roc_auc(truth = pass_fail, .pred_fail)

course_aug %>% 
  roc_auc(truth = pass_fail, .pred_pass)

## Evaluate

train_predictions <- 
  predict(lr_fit, train_data) %>% 
  bind_cols(predict(lr_fit, train_data, type = "prob")) %>% 
  bind_cols(train_data %>% select(pass_fail))

train_predictions %>%                   # test set predictions
  accuracy(truth = pass_fail, .pred_class)


test_predictions <- 
  predict(lr_fit, test_data) %>% 
  bind_cols(predict(lr_fit, test_data, type = "prob")) %>% 
  bind_cols(test_data %>% select(pass_fail))

test_predictions %>%                   # test set predictions
  accuracy(truth = pass_fail, .pred_class)


# Random Forest

library(ranger)
library(vip)

rf_mod <- 
  rand_forest(trees = 1000) %>% 
  set_engine("ranger", importance = "impurity") %>% 
  set_mode("classification")

trees_workflow <- 
  workflow() %>% 
  add_model(rf_mod) %>% 
  add_recipe(course_recipe)

trees_fit <- 
  trees_workflow %>% 
  fit(data = train_data)

#trees_fit %>% 
#  extract_fit_parsnip() %>% 
#  tidy()

predict(trees_fit, test_data)

trees_aug <- 
  augment(trees_fit, test_data)

trees_aug

# The data look like: 
trees_aug %>%
  select(student_id, pass_fail, .pred_class, .pred_pass)

trees_aug %>% 
  roc_curve(truth = pass_fail, .pred_fail) %>% 
  autoplot()

trees_aug %>% 
  roc_auc(truth = pass_fail, .pred_fail)

trees_aug %>% 
  roc_auc(truth = pass_fail, .pred_pass)

## Evaluate

train_predictions <- 
  predict(trees_fit, train_data) %>% 
  bind_cols(predict(trees_fit, train_data, type = "prob")) %>% 
  bind_cols(train_data %>% select(pass_fail))

train_predictions %>%                   # test set predictions
  accuracy(truth = pass_fail, .pred_class)



test_predictions <- 
  predict(trees_fit, test_data) %>% 
  bind_cols(predict(trees_fit, test_data, type = "prob")) %>% 
  bind_cols(test_data %>% select(pass_fail))

test_predictions %>%                   # test set predictions
  accuracy(truth = pass_fail, .pred_class)




