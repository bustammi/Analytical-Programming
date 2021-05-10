# Intro-to-Analytical-Programming
## ITEC 2600 Project - MATLAB

**The following MATLAB code purpose is to manipulate and extract the data from 
UCI Machine Learning Repository: Census Income Data Set.**

The primary intent was to manipulate the data set in a way that predicts whether the individual can gain an annual income of $50 000 a year based on:

1. Estimate of the working class age (16+) in each state
2. Race, Age and Sex. 

However, the current focus is towards the correlation between other predictors of data 
that determines the socio-economic status. 

The following categories that have been considered consists of: 

1. Work-Class 
2. Education 
3. Sex 
4. Hours Per Week. 
 
**The current dataset is condensed to provide ease of accessibility to the readers. Statistical analysis was performed using MATLAB_R2019 B Academic License Software.**

The lesson gained from this project is to advance the understanding of the MATLAB environment, such as learning how data can be manipulated and represented in many ways. This MATLAB code provides an overview of the dataset through statistical and graphical representation and finds any correlations with the referenced dataset.

*This MATLAB Code and Project is solely intended for educational use only and will not be re-used in a way that does not abide by academic integrity*

_____________________________________
## Sample Condensed Data

``` matlab 
TC = T(1:3,{'workclass','education','sex','hours_per_week','years','actualIncome'}}
```
* Creates a 3 by 6 table and queries the following column names:

  1. Workclass
  2. Education
  3. Sex
  4. Hours Per Week
  5. Years
  6. Actual Income

## Reading the Table and Removing/Updating Columns

```matlab
T = readtable('adult.xls');
T(:,[1,3,5,6,7,8,9,11,12,14]) = [];
T([151:end],:)=[];
T.Var6 = randi([2000 2019],1, 150)';
T.Var7(:,1) = 1:150
```

*Still on progress*
  
  


