install.packages("healthcareai")
library(healthcareai)
str(pima_diabetes)
head(pima_diabetes)
summary(pima_diabetes)

#Easy machine learning
quick_models <- machine_learn(pima_diabetes, patient_id, outcome = diabetes)

quick_models
predictions <- predict(quick_models)
predictions
plot(predictions)

quick_models %>% 
  predict(outcome_groups = 2) %>% 
  plot()

#DATA PROFILING
missingness(pima_diabetes) %>% 
  plot()

#DATA PREPARATION
split_data <- split_train_test(d = pima_diabetes,
                               outcome = diabetes,
                               p = .9,
                               seed = 84105)


prepped_training_data <- prep_data(split_data$train, patient_id, outcome = diabetes,
                                   center = TRUE, scale = TRUE,
                                   collapse_rare_factors = FALSE)
#Model Training
models <- tune_models(d = prepped_training_data,
                      outcome = diabetes,
                      tune_depth = 25,
                      metric = "PR")

evaluate(models, all_models = TRUE)

models["Random Forest"] %>% 
  plot()

#Faster Model Training
untuned_rf <- flash_models(d = prepped_training_data,
                           outcome = diabetes,
                           models = "RF",
                           metric = "PR")
#Model Interpretation
interpret(models) %>% 
  plot()


#Variable Importance
get_variable_importance(models) %>%
  plot()

#EXPLORE

explore(models) %>% 
  plot()

#Prediction
predict(models)

test_predictions <- 
  predict(models, 
          split_data$test, 
          risk_groups = c(low = 30, moderate = 40, high = 20, extreme = 10)
  )
plot(test_predictions)
