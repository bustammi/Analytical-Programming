# Intro-to-Analytical-Programming
# Data Analytics Project - MATLAB

**The following MATLAB code purpose is to manipulate and extract the data from 
UCI Machine Learning Repository: Census Income Data Set.**

## 1st Stage: Formulating a Question/Problem
_____________________________________

**Hypothesis:**  What is the effect of the socio-economic factors (i.e., (1) Work-Class; (2) Education, (3) Sex; (4); Hours Per Week) on the annual income that an individual earns at United States? 

**Questions Asked:**

1. Are the predictor (independent variables) such as work-class, education, sex, and hours worked per week interdependent?

2. How strong is the correlation between the predictor variables and annual income (i.e., dependent variable) of an indiviual at US?

3. Is a single predictor variable sufficient enough in influencing the annual income of an individual 


The lesson gained from this project is to advance the understanding of the MATLAB environment, such as learning how data can be manipulated and represented in several methods. This MATLAB code provides an overview of the "UCI Machine Learning Repository: Census Income Data Set dataset" through statistical and graphical representation. Hence, another purpose of this project is to extract and manipulate the data to find solutions through the "Questions Asked" above.

_____________________________________

## 2nd Stage: Acquiring and Cleaning the Data

### Sample Condensed Data

#### Input: 

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

#### Output: 
![image](https://user-images.githubusercontent.com/67813147/172072841-4d57dc9a-8387-42bc-9d7e-c83906e2748c.png)


_____________________________________

### Reading the Table and Removing/Updating Columns

#### Input: 

```matlab
T = readtable('adult.xls');
T(:,[1,3,5,6,7,8,9,11,12,14]) = [];
T([151:end],:)=[];
T.Var6 = randi([2000 2019],1, 150)';
T.Var7(:,1) = 1:150
```

* We can read the annual income dataset by using ```matlab readtable('adult.xls')``` 

* Remove the unnecessary columns in the dataset that is not relevant to the hypothesis by ```matlab T(:,[1,3,5,6,7,8,9,11,12,14])``` 

* Create an additional column for increasing the granularity to "coarse" by generating a discrete array of random integers for the "Years" column through ```matlab T.Var6 = randi([2000 2019],1, 150)';```

**Note:** Increasing the granularity of data to coarse will help the audience understand and analyze data in-depth. In particular, one has easier understanding in how the predictor variables will influence the dependent variable (i.e., annual income). Hence, the benefit of adding a column for "Years" enables the individual (i.e., researcher) to conduct a time-series analysis and observe the complex relationship between multiple variables (e.g., hours worked, years).

_____________________________________
### Settting the properties for column names 

```matlab
T.Properties.VariableNames{1} = 'workclass';
T.Properties.VariableNames{2} = 'education';
T.Properties.VariableNames{3} = 'sex';
T.Properties.VariableNames{4} = 'hours_per_week';
T.Properties.VariableNames{5} = 'annualIncome';
T.Properties.VariableNames{6} = 'years'; %discrete uniform sample of integer
T.Properties.VariableNames{7} = 'actualIncome';
```


### Establishing the data types for all columns

```matlab
T.workclass = string(T.workclass);
T.education = string(T.education);
T.sex = string(T.sex);
T.hours_per_week = double(T.hours_per_week);
T.annualIncome = string(T.annualIncome);
T.years = double(T.years);
T.actualIncome = double(T.actualIncome);
```

### Removing null values from the dataset

```matlab
%Removing missing values from data
T(ismember(T.workclass,'?'),:)=[];
```

**Note:** we are using the _ismember_ function that returns a logical datatype. If the condition is true (i.e., workclass has missing rows), then it will be assigned to a value of an empty vector and be removed.
_____________________________________

## Stage 3: Conducting an Exploratory Data Analysis (EDA) for UCI Annual Income Dataset

**Exploratory Data Analysis (EDA):** According to IBM, EDA is the process of studying and investigating data sets and describe their essential properties by applying data visualisation techinques. It supports in determining how to effectively manipulate the data sources to obtain the answers required, making it simpler for data scientists to uncover patterns, detect anomalies, test hypotheses, and validate assumptions.

***Source: https://www.ibm.com/cloud/learn/exploratory-data-analysis***

_____________________________________

### Generating a Quantile-Quantile (QQ) Plot based on the UCI Annual Income Dataset 

```matlab
figure('OuterPosition',[20 20 700 800],'Color','w');
x = T.years;
y = T.actualIncome;
z = T.hours_per_week;
plot(x,y,'linestyle', 'none','color',[0 0.5 0],'marker', 'o')
xticks(2000:2:2019)
xticklabels(2000:2:2019)
yticks(0:10000:150000)
yticklabels(0:10000:100000)
ytickformat('usd')
%Another y axis for overlay
hold on
yyaxis right
plot(x,z,'linestyle','none','color','red','marker','d')
qqplot(x,z)
hold off
```

* To define the dimension of the QQ-Plot and set the backgorund to white, we can use this ```matlab figure('OuterPosition',[20 20 700 800],'Color','w');``` 

* The "x" variable = years; The "y" variable = annual income; The "z" variable = hours worked

* We can define the parameters in "plot()" function, in our case, we established the parameters of having no linestyle and green cicrcle marker for annual income.

* The x-ticks (i.e., years) and y ticks (i.e., annual income) is modified to reflect the faithfulness in real-world setting by using a pre-defined format (e.g., USD)

_____________________________________
### Formatting for the Quantiled-
