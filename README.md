# Intro-to-Analytical-Programming
# Census Income Data Analytics Project (EDA) - MATLAB

** The following MATLAB code purpose is to manipulate and extract the data from 
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

#### Input:

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

#### Input:

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

#### Input:

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

#### Input:

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
### Formatting for the Quantile-Quantile (QQ) Plot

#### Input:

```matlab 
title('Plot for Annual Income with Hours Worked vs Years', 'FontSize', 16);
xlabel('Years');
yyaxis left;
ylabel('Annual Income');
yyaxis right;
ylabel('Hours Worked');
ldg = legend('Annual Income', 'Hours Worked', 'Deviation', 'Normal', 'Error');
leg.NumColumns = 5;
legend('FontSize',13)
f = get(gca,'XTickLabel');  
set(gca,'XTickLabel',f,'fontsize',12,'FontWeight','bold')
set(gca,'XTickLabelMode','auto')
set(gca,'linewidth',1.5)
```

_____________________________________
### Generating Conditional Logic for Plotting Annual Income

 * The original dataset does not have a numerical format for representing the annual income and only contains two conditions (i.e., strings), which is an individual in U.S. either earns (">50K") or <=50K".

* This type of data formatting will not provide meaningful insights in showing the strength of correlation between the predictor variables and dependent variable (i.e., annual income) due to the lack of granularity in data.

* We can modify this issue by creating a logical condition when generating the qq-plot, which is shown in the code below:

#### Input:

```matlab
for i = 1:length(T.annualIncome)
if strcmp( T.annualIncome(i), '<=50K' );
         T.actualIncome(i) = randi(39000)+10000;
     else
         T.actualIncome(i) = randi(100000)+50000;
     end
end
```

* Generates a for-loop statement that checks the value listed in ***T.annualIncome*** and sets two conditions:

  * When "***T.annualIncome***" contains a string of "<=50K", then the new column "***T.actualIncome***" will contain random uniform discrete integers specified within $10K to $49K using the ***randi()*** function.

  * Otherwise, if the condition is false (i.e., "***T.annualIncome***" contains a string of ">50K". Then, the "***T.actualIncome***" will contain random uniform discrete integers specified within $51K to $100K using the ***randi()*** function.

_____________________________________
### Graphical QQ-Plot for Annual Income Dataset

#### Output: 

<img width="538" alt="image" src="https://user-images.githubusercontent.com/67813147/172075746-97766b10-6c31-419a-ba48-facaf641a112.png">

##### Findings: 
* QQ-Plot suffest a weak correlation between annual income and hours worked per week.

* Higher discrepancy in individuals earning ">50K" suggesting that only few people might worked more than 40 hours in the extracted dataset.

* Omitted predictors (i.e., work-class, age, education) might have influenced the representation of data in qq-plot.

* In the future, expanding the granularity for an individual in each state or city might provide more meaningful insights in analyzing the annual income. 

  * It is possible that individuals who resides in New York or California has higher income 
    due to higher housing prices or living expenses.
    
_____________________________________
### Generating Pie Charts based on the UCI Annual Income Dataset 

### Pie Chart for Gender vs. Annual Income 

#### Input: 
```matlab
%Pie for sex, education and workclass
%set pie for comparison with offsetting (slice) the largest component
               %those who have more than 50k and less than 50k for all of
               %them, with labels and legend
 
% Pie Chart for Gender vs. Annual Income
%-------------------------------------------------------
 
%Annual Income for Male
pMALE = (  strcmp( string(T.sex),"Male")  &  (T.actualIncome<50000)  );
 
%Annual Income for Female
pFEMALE = (  strcmp( string(T.sex),"Female")  &  (T.actualIncome<50000)  );
 
labels = {'Earned more than 50K', 'Earned less than 50K'};

% Plot 1 - Pie Chart for Male
%-------------------------------------------------------
figure('OuterPosition',[20 20 1200 1400],'Color','w');

t = tiledlayout(2,1);
ax1 = nexttile;
pf1 = pie(ax1, categorical(pMALE) );

title('Annual Income for Male', 'FontSize',24);
pText = findobj(pf1,'Type','text');

labelA = ['>50K ' pText(1).String(6:end)];
labelB = ['<50K ' pText(2).String(6:end)];
set(findobj(pf1,'type','text'),'fontsize',14)
pText(1).String = labelA;
pText(2).String = labelB;
legend(labels,'Location','northwest','FontSize',14)
```

#### Output:
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172076805-04303a66-4b32-4471-b0ba-732e962ddb0d.png">


##### Findings:

* Annual Income for Males in US who earned ">50K" and "<50K" were equally distributed.

* Annual Income for Females in US who earned ">50K" were 76% and "<50K" were 24%.

##### Notes:

* The nature of extracting or condensing the data to 150 entries might have influenced the results into being less statistically significant.

* Majority of the female entries has higher socio-economic status resulting in higher income.

* Therefore, "gender" as a predictor variable cannot single-handedly determine the annual income of individual since there are multiple predictor variables interdependent to each other.

_____________________________________

### Pie Chart for Education vs. Annual Income 

#### Input: 
```matlab
% Plot 3 - Pie Chart for Working Class with income more than 50K
%-------------------------------------------------------
figure('OuterPosition',[20 20 1200 1400],'Color','w');

t = tiledlayout(2,1);
ax1 = nexttile;
pf3 = pie(ax1, categorical(workdata), explode);
title('Workclass for Income >50K','FontSize',24)
lgd = legend('Location','northwest', 'FontSize', 14)
lgd.Title.String = 'Legend';
lgd.Title.FontSize = 12;
set(findobj(pf3,'type','text'),'fontsize',12.5)

%Plot 4  - Pie Chart for Working Class with income less than 50K
%-------------------------------------------------------
ax2 = nexttile;
explode = {'Private'}
pf4 = pie(ax2, categorical(workdata2), explode, labels);
title('Workclass for Income <= 50K', 'FontSize', 24)
lgd = legend('Location','northwest', 'FontSize', 14)
lgd.Title.String = 'Legend';
lgd.Title.FontSize = 12;
delete(findobj(pf4,'String','Federal-gov'))
delete(findobj(pf4,'String','Local-gov'))
delete(findobj(pf4,'String','State-gov'))
delete(findobj(pf4,'String','Self-emp-inc'))
delete(findobj(pf4,'String','Self-not-emp-inc'))
set(findobj(pf4,'type','text'),'fontsize',12.5)
```
#### Output:
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172076920-561383c9-160c-424b-b62d-b29689b7c05b.png">

##### Findings: 
* 53% of individuals in US who earns more than $50K (i.e., >$50K) are hired privately (regardless of their gender).

* 70% of individuals who earns less than $50K (<=$50K) are hired privately (regardless of their gender).
