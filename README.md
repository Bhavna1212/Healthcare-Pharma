# Healthcare-Pharma
Real World Healthcare/Pharma Case Studies: Data Analytics Using R
Pima_diabetes is a dataset containing diabetes status and other health-related variables for 768 females, at least 21 years old, of Pima Indian heritage. As pointed out (see source URL below), the source data had some biologically impossible zero values. We have replaced zero values in every variable except Pregnancies with NA.
A tibble data frame with 768 rows and 10 variables:
1.	patient_id- Unique identifier
2.	pregnancies -Number of times pregnant
3.	plasma_glucose- Plasma glucose concentration 2 hours in an oral glucose tolerance test
4.	diastolic_bp- Diastolic blood pressure (mm Hg)
5.	skinfold-Triceps skin fold thickness (mm)
6.	insulin-2-Hour serum insulin (mu U/ml)
7.	weight_class-Derived from BMI
8.	pedigree-Diabetes pedigree function
9.	age-Age (years)
10.	diabetes-Y/N diagnosis per WHO criteria


I have used the healthcare package “healthcareai” .
uses of functions “machine_learn” , prep_data, tune_model, fash_model.
The machine_learn function automatically trained classification algorithms because the outcome variable diabetes is categorical in the dataset, and has executed cross validation for three machine learning models: random forests, XGBoost, and glmnet. The best model was Random forest with AUROC 0.84.
For precise control tune_models and flash_models are the model-training function. Flash_model() function is for speed .It uses fixed sets of hyperparameter values to train the models, so you still get a model customized to your data, but without burning the electricity and time to precisely optimize all the details.
For our model has interpreted that , the low value of weight_class_normal signifies that people with normal weight are less likely to have diabetes. Similarly, plasma glucose is associated with increased risk of diabetes after accounting for other variables.

