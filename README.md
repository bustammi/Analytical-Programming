# Analytical-Programming
# Census Income Data Analytics Project (EDA) - MATLAB

**The following MATLAB code purpose is to manipulate and extract the data from 
UCI Machine Learning Repository: Census Income Data Set.**

## 1st Stage: Formulating a Question/Problem
_____________________________________

**Hypothesis:**  What is the effect of the socio-economic factors (i.e., (1) Work-Class; (2) Education, (3) Sex; (4); Hours Per Week) on the annual income that an individual earns at United States? 

**Questions Asked:**
_____________________________________

1. Are the predictor (independent variables) such as work-class, education, sex, and hours worked per week interdependent?

2. How strong is the correlation between the predictor variables and annual income (i.e., dependent variable) of an indiviual at US?

3. Is a single predictor variable sufficient enough in influencing the annual income of an individual?


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

https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L1-L6

* We can read the annual income dataset by using ```matlab readtable('adult.xls')``` 

* Remove the unnecessary columns in the dataset that is not relevant to the hypothesis by ```matlab T(:,[1,3,5,6,7,8,9,11,12,14])``` 

* Create an additional column for increasing the granularity to "coarse" by generating a discrete array of random integers for the "Years" column through ```matlab T.Var6 = randi([2000 2019],1, 150)';```

**Note:** Increasing the granularity of data to coarse will help the audience understand and analyze data in-depth. In particular, one has easier understanding in how the predictor variables will influence the dependent variable (i.e., annual income). Hence, the benefit of adding a column for "Years" enables the individual (i.e., researcher) to conduct a time-series analysis and observe the complex relationship between multiple variables (e.g., hours worked, years).

_____________________________________
### Settting the properties for column names 

#### Input:

https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L8-L15


### Establishing the data types for all columns

#### Input:

https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L20-L27

### Removing null values from the dataset

#### Input:

https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L17-L18

**Note:** we are using the _ismember_ function that returns a logical datatype. If the condition is true (i.e., workclass has missing rows), then it will be assigned to a value of an empty vector and be removed.
_____________________________________

## 3rd Stage: Conducting an Exploratory Data Analysis (EDA) for UCI Annual Income Dataset

**Exploratory Data Analysis (EDA):** According to IBM, EDA is the process of studying and investigating data sets and describe their essential properties by applying data visualisation techinques. It supports in determining how to effectively manipulate the data sources to obtain the answers required, making it simpler for data scientists to uncover patterns, detect anomalies, test hypotheses, and validate assumptions.

***Source: https://www.ibm.com/cloud/learn/exploratory-data-analysis***

_____________________________________

### Generating a Quantile-Quantile (QQ) Plot based on the UCI Annual Income Dataset 

#### Input:

https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L43-L60

* To define the dimension of the QQ-Plot and set the backgorund to white, we can use this ```matlab figure('OuterPosition',[20 20 700 800],'Color','w');``` 

* The "x" variable = years; The "y" variable = annual income; The "z" variable = hours worked

* We can define the parameters in "plot()" function, in our case, we established the parameters of having no linestyle and green cicrcle marker for annual income.

* The x-ticks (i.e., years) and y ticks (i.e., annual income) is modified to reflect the faithfulness in real-world setting by using a pre-defined format (e.g., USD)

_____________________________________
### Formatting for the Quantile-Quantile (QQ) Plot

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L62-L75

_____________________________________
### Generating Conditional Logic for Plotting Annual Income

 * The original dataset does not have a numerical format for representing the annual income and only contains two conditions (i.e., strings), which is an individual in U.S. either earns (">50K") or <=50K".

* This type of data formatting will not provide meaningful insights in showing the strength of correlation between the predictor variables and dependent variable (i.e., annual income) due to the lack of granularity in data.

* We can modify this issue by creating a logical condition when generating the qq-plot, which is shown in the code below:

#### Input:

https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L30-L37

* Generates a for-loop statement that checks the value listed in ***T.annualIncome*** and sets two conditions:

  * When "***T.annualIncome***" contains a string of "<=50K", then the new column "***T.actualIncome***" will contain random uniform discrete integers specified within $10K to $49K using the ***randi()*** function.

  * Otherwise, if the condition is false (i.e., "***T.annualIncome***" contains a string of ">50K". Then, the "***T.actualIncome***" will contain random uniform discrete integers specified within $51K to $100K using the ***randi()*** function.

_____________________________________
### Graphical QQ-Plot for Annual Income Dataset

#### Output: 

<img width="1000" alt="image" src="https://user-images.githubusercontent.com/67813147/172075746-97766b10-6c31-419a-ba48-facaf641a112.png">

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
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L77-L133

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

### Pie Chart for Working Class vs. Annual Income 

#### Input: 
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L135-L174



#### Output:
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172076920-561383c9-160c-424b-b62d-b29689b7c05b.png">

##### Findings: 
* 53% of individuals in US who earns more than $50K (i.e., >$50K) are hired privately (regardless of their gender).

* 70% of individuals who earns less than $50K (<=$50K) are hired privately (regardless of their gender).

* There is higher percentage of individuals in private companies who earns less than ($<50K) because private companies might be  "start-up companies". Hence, the data reflects the "faithfulness" attribute, where most start-up companies pay less to their employees due to lack of funding or investors.

_____________________________________

### Pie Chart for Education vs. Annual Income 

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L178-L206


#### Output: 
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172077895-bd755161-524b-4061-b669-82405d613bc5.png">

##### Findings:
* For individuals who earned more than $50K (>=50K)
  
  * 28% of individuals has a Bachelor's Degree

  * 17% of individuals has a College Diploma

  * 11% of individual has a Master's Degree


* For individuals who earned less than $50K (<$50K)

  * 12% of individuals hold a Bachelor's Degree

  * 25% of individuals has a College Diploma

  * 4% of individuals has a Master's Degree


* Hence, the results of data are highly "faithful" to today's actual reality of workplace environment.

* The results suggest that an individual's education has a strong and postive correlation with their annual income

  * Individuals who earned more than "$50K" have higher percentage of education in
    Bachelor's and Master's Degree compared to individuals who earned less than "$50K".
    
  *  We can infer that individuals who earn more than $50K holds an occuputation that deals      with higher complexity (e.g., an accountant or Business Analysis might need to deal        with customized software or programming languages, such as Excel, Python, or ERP)

* It supports the premise that "Education" is a strong predictor variable, but it cannot solely determine the annual income since the analysis only focused on the simple hypothesis. 

   * It does not consider the specific context of multiple predictor variables within each      other. 

   * Does the aggregation of work-class and education provide a more accurate and faithful 
     result than "education" alone?
   
_____________________________________

### Generating Histograms based on the UCI Annual Income Dataset 

### Histogram for Hours Per Week

#### Input: 
https://github.com/bustammi/Analytical-Programming/blob/0354bc13f3124dfecb3647ea342e3bfb141a3f55/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L213-L218

#### Output:
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172079086-e4f8fdb4-7fa6-4de7-a17a-b6a8dbc792e5.png">

  ```
  pd = 

  NormalDistribution

  Normal distribution
     mu = 41.2727   [39.5572, 42.9882]
    sigma = 10.3775   [9.29814, 11.7426]
  ```
  
##### Findings: 

  * Construct a histogram with a normal distribution fit by using ``` histfit(hpw)``` and use ``` fistdit(hpw, Normal)``` to acquire the 
  parameters used in fitting.
  
  * "mu" = mean; "sigma" = std, of a normal distribution

  * parameters inside the bracket is the 95% confidence interval (i.e.., range of values that an individual can be 95% sure that it includes the true     mean of population.

  * This histogram shows the frequence of hours worked from individuals in the US. According to the output, it is skewed heavily in the center 
  meaning that most individuals worked approximately 40 hours.
_____________________________________
### Histogram for Work-Class

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L212-L215

#### Output: 
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172079205-af38cade-20f6-49fc-b553-345bfb5664c1.png">

_____________________________________

### Histogram for Sex

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L217-L219

#### Output:
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172079226-b766235c-092b-4196-917d-7be59b682826.png">

_____________________________________

### Statistical Analysis based on the UCI Annual Income Dataset 

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L221-L250

#### Output:
    
![image](https://user-images.githubusercontent.com/67813147/172079606-a9017c76-3562-460f-98c7-b3977df5a383.png)


![image](https://user-images.githubusercontent.com/67813147/172079791-8cc00276-4f73-4144-826b-0baacf948773.png)


##### Findings for Hours Per Worked (hpw) Table:

***Note: rounded to the nearest decimal***

* Minimum for hours per worked = 13 hours
* Maximum for hours per worked = 80 hours
* Average for Hours per worked = 41 hours
* Median for Hours per worked = 40 hours
* Mode for Hours per worked = 40 hours
* Standard Deviation for Hours per worked = 10 hours 

##### Findings for Annual Income (ai) Table:

***Note: rounded to the nearest decimal***

* Minimum for Annual Income = $10,021 USD
* Maximum for Annual Income  = $148,000 USD
* Average for Annual Income  = $46,544 USD
* Median for Annual Income  = $36,341 USD
* Mode for Annual Income  = $10,021 USD
* Standard Deviation for Annual Income  = $34,024 USD

_____________________________________
## 4th Stage: Drawing Conclusion and Inferences
