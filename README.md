# Food Security Education

## This project creates and trains a logistic regression model to predict a child's grades after inputting variables such as poverty level, food insecurity, age, and family structure, using data from the National Survey of Children's Health.

## Introduction
We made these models to answer our research question: "What factors in a child's life most significantly impact their grades?" 
We were initially interested in a perspective from more countries than just the US, so we explored some data from Brazil as well.
However, we found that there was much more data available from the US, and that it would be hard to match indices for health and financial factors.
You will see many explorations of the data, including different visualizations that helped bring us to our research question.
We also explored a few methods of modeling, and ultimately decided on logistic regression modelling to predict categorical values.
Our main product of this project is the blog post, which contains an interactive element from a Shiny app that we created. 
The app allows the user to input a few variables to generate an expected outcome with our model, and the variable selection can be changed with the app file. 

## Full list of factors to predict grades in logistic regression model:
Here is a list of all factors that we selected to predict grades with our model. Please refer to the NSCH codebook for explanations of the variables and their value meanings.
The name of the variable in the dataset is in parenthesis next to each one.

* Child Health Status (ChHlthSt_2324)
* Low Birth Weight (LowBWght_2324)
* Physical Activity (PhysAct_2324)
* Mental Health Conditions (Cond2more_2324)
* Whether they have ADHD or not (ADHDind_2324)
* ADHD Severity (ADHDSevInd_2324)
* Autism severity (ASDSevInd_2324)
* Frequency that the student is bullied (bullied_2324)
* Frequency that the student bullies others (bully_2324)
* Ease of making friends (MakeFriend_2324)
* Mental, emotional, developmental, or behavioral problems (MEDB10ScrQ5_2324)
* Medical Care (MedCare_2324)
* Mental Heatlh Care (MentHCare_2324)
* Special Education Plan (SpEducPlan_2324)
* Repeated Grade (ReptGrade_2324)
* Poverty Level (povlev4_2324)
* Age category (age5_2324)
* Sex (sex_2324)
* Food security (FoodSit_2324)
* Food Cash (FoodCash_2324)
* Housing Instability (HousingInstab_2324)
* Family structure (famstruct5_2324)

We cleaned this data by filtering out null values in each variable.

## How to Use 

### R packages required:
* GGally
* ggplot2
* performance
* MASS
* dplyr
* forcats
* haven
* purrr
* readr
* stringr
* tibble
* tidyr
* tidyverse
* pacman
* broom
* dials
* infer
* lubridate
* modeldata
* parsnip
* recipes
* rsample
* scales
* shiny
* tailor
* tune
* workflows
* wrokflowsets
* yardstick
* Matrix
* glmnet
* vip

### Data:
Data files are not included in this repository due to size and licensing constraints, please download the NSCH datasets separately and place them in the data/raw/ folder.

Clean the data using the clean_data.Rmd file, which selects variables of interest, filters out null values, and combines the age separated grades into a single "grades_2324" variable.

### Visualizations:
Find various visualizations surrounding exploratory data with our "viz" files, including 
`bullying_viz`, `food_edu_brazil_viz`, and `grades_foodsecurity_viz`.

### Modeling:
We tried a few modeling methods, including building a null model and adding single variables at a time, linear regression, and lasso modeling, and ultimately decided to use logistic modeling.
We used ANOVA to look at correlation between the variables and also identify the ones with the strongest influence on grade prediction.

#### Model Flow:
The model first converts numerical categories of grades into categorical grades, "excellent", "good", "fair", and "poor". Next, it splits the data into training and testing pieces, 70% training and 30% testing. You can change this ratio with `split` in the `logistic_model` file.
Then, the grade categories are given weights based on how common they are in the training data. A workflow is created with these weights and the recipe, which notes that we are predicting grades using all other factors. 
To avoid overfitting, we tune a penalty for the model with a range based on cross validation. Finally, predictions `.pred_class` are compared with actual testing data `grades_2324` to analyze accuracy of predictions.

#### Using our logistic models:
Our model is trained with 70% of the NSCH data and tested with the remaining 30%. 
We visualized the accuracy of the model with a confusion matrix, and then created another model to produce a binary output of "at risk" grades (poor or fair) and "not at risk" grades (good or excellent), given only food security factors (Food Cash and Food Situation).

To use the first model, input values for each of the variables using the NSCH codebook as a guide. Examples of this are in the `Three_profiles.Rmd` file, where we created 3 fictional students and predicted their grades.
Our blog, `food_security_blog`, displays the shiny app where variables are inputted to see predicted grade.

### Interpretation of Results:
Use the second logistic model with binary outcome to predict the odds of at risk grades for increasing severity of Food Cash and Food Insecurity.
We found that students are 1.42 times more likely to have at risk grades with each step towards lesser access to food, and 
1.40 times more likely to have at risk grades with increasing level of family dependence on food cash.