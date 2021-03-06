# Analytical-Programming
# Census Income Data Analytics Project (EDA) - MATLAB

**The following MATLAB code purpose is to manipulate and extract the data from 
UCI Machine Learning Repository: Census Income Data Set.**

## 1st Stage: Formulating a Question/Problem
_____________________________________

**Hypothesis:**  What is the effect of the socio-economic factors (i.e., (1) Work-Class; (2) Education, (3) Sex; (4); Hours Per Week) on the annual income that an individual earns in the United States? 

**Questions Asked:**
_____________________________________

1. Are the predictor (independent variables) such as work class, education, sex, and hours worked per week interdependent?

2. How strong is the correlation between the predictor variables and an individual's annual income (i.e., dependent variable) in the US?

3. Are multiple variables sufficient enough to influence an individual's annual income?


This MATLAB code provides an overview of the "UCI Machine Learning Repository: Census Income Data Set dataset" through statistical and graphical representation. The lesson gained from this project is to advance the understanding of the MATLAB environment, such as learning how data can be manipulated and represented in several methods. Hence, another purpose of this project is to conduct exploratory data analysis to find solutions for the "Questions Asked" above.

_____________________________________

## 2nd Stage: Acquiring and Cleaning the Data

### Sample Condensed Data

#### Input: 

https://github.com/bustammi/Analytical-Programming/blob/a2e909b69c16e61f8679fdd91a4744243801288c/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L39-L40

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

**Note:** Increasing the granularity of data to coarse will help the audience understand and analyze data in-depth. In particular, one can better understand how the predictor variables will influence the dependent variable (i.e., annual income). Hence, adding a column for "Years" enables one to conduct a time-series analysis and observe the complex relationship between multiple variables (e.g., hours worked and years).


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

* To define the dimension of the QQ-Plot and set the background to white, we can use this ```matlab figure('OuterPosition',[20 20 700 800],'Color','w');``` 

* The "x" variable = years; The "y" variable = annual income; The "z" variable = hours worked

* We can define the parameters in "plot()" function, in our case, we established the parameters of having no linestyle and green cicrcle marker for annual income.

* The x-ticks (i.e., years) and y ticks (i.e., annual income) is modified to reflect the faithfulness in real-world setting by using a pre-defined format (e.g., USD)

_____________________________________
### Formatting for the Quantile-Quantile (QQ) Plot

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L62-L75

_____________________________________
### Generating Conditional Logic for Plotting Annual Income

* The original dataset does not have a numerical format for representing the annual income. It only contains two conditions (i.e., strings), which is   an individual in the US either earns (">50K") or ("<=50K").

* Due to the lack of granularity in data, this type of data formatting will not provide meaningful insights in showing the strength of correlation between the predictor and dependent variables (i.e., annual income).

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
* QQ-Plot suggests a weak correlation between annual income and hours worked per week.

* Higher discrepancy in individuals earning ">50K," suggesting that only a few people might work more than 40 hours in the extracted dataset.

* Omitted predictors (i.e., work class, age, education) might have influenced data representation in QQ-plot.

* In the future, expanding the granularity for an individual in each state or city might provide more meaningful insights into analyzing the annual income. 

  * It is possible that individuals who reside in New York or California have higher incomes due to higher housing prices or living expenses.
    
_____________________________________
### Generating Pie Charts based on the UCI Annual Income Dataset 

### Pie Chart for Gender vs. Annual Income 

#### Input: 
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L77-L133

#### Output:
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172076805-04303a66-4b32-4471-b0ba-732e962ddb0d.png">


##### Findings:

* Annual Income for Males in the US who earned ">50K" and "<50K" were equally distributed.

* Annual Income for Females in the US who earned ">50K" was 76%, and "<50K" were 24%.

##### Notes:

* The nature of extracting or condensing the data to 150 entries might have influenced the results to be less statistically significant.

* Majority of the female entries have higher socio-economic status resulting in higher income.

* Therefore, "gender" as a predictor variable cannot single-handedly determine the individual's annual income since multiple predictor variables are interdependent.

_____________________________________

### Pie Chart for Working Class vs. Annual Income 

#### Input: 
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L135-L174



#### Output:
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172076920-561383c9-160c-424b-b62d-b29689b7c05b.png">

##### Findings: 
* 53% of individuals in the US who earns more than $50K (i.e., >$50K) are hired privately (regardless of their gender).

* 70% of individuals who earn less than $50K (<=$50K) are hired privately (regardless of their gender).

* There is a higher percentage of individuals in private companies who earns less than ($<50K) because private companies might be  "start-up companies." Most start-up companies pay less to their employees due to a lack of funding or investors. Hence, the data reflects the "faithfulness" attribute.  

_____________________________________

### Pie Chart for Education vs. Annual Income 

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L178-L206


#### Output: 
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172077895-bd755161-524b-4061-b669-82405d613bc5.png">
   
##### Findings:
* For individuals who earned more than $50K (>=50K)
  
  * 28% of individuals have a Bachelor's Degree

  * 17% of individuals have a College Diploma

  * 11% of an individual have a Master's Degree


* For individuals who earned less than $50K (<$50K)

  * 12% of individuals have a Bachelor's Degree

  * 25% of individuals have a College Diploma

  * 4% of individuals have a Master's Degree


* Hence, the data results are highly "faithful" to today's actual reality of the workplace environment.

* The results suggest that an individual's education has a strong and positive correlation with their annual income

  * Individuals who earned more than "$50K" have a higher percentage of education in Bachelor's and Master's Degree than individuals who earned less     than "$50K".
    
  *  We can infer that individuals who earn more than $50K hold an occupation that deals with higher complexity (e.g., an accountant or Business          Analysis might need to deal with customized software or programming languages, such as Excel, Python, or ERP)

* It supports the premise that "Education" is a vital predictor variable, but it cannot solely determine the annual income since the analysis only     focused on the simple hypothesis. 

   * It does not consider the specific context of multiple predictor variables within each other. 

   * Does the aggregation of work-class and education provide a more accurate and faithful result than "education" alone?

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

  * Parameters inside the bracket are the 95% confidence interval (i.e.., the range of values that an individual can be 95% certain that it includes     the population's true mean.

  * This histogram shows the frequency of hours worked by individuals in the US. According to the output, it is skewed heavily in the center 
    meaning that most individuals worked approximately 40 hours.
_____________________________________

### Histogram for Work-Class

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L212-L215

#### Output: 
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172079205-af38cade-20f6-49fc-b553-345bfb5664c1.png">

     Federal-gov             7 
     Local-gov               8 
     Private               106 
     Self-emp-inc            5 
     Self-emp-not-inc       12 
     State-gov               5 

_____________________________________

### Histogram for Education

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/0354bc13f3124dfecb3647ea342e3bfb141a3f55/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L228-L232

#### Output:
![Histogram for Education](https://user-images.githubusercontent.com/67813147/172103744-6e2117d9-a456-40ea-b0a8-5b35c9d7498a.jpg)

     11th               7 
     5th-6th            1 
     7th-8th            2 
     9th                5 
     Assoc-acdm         8 
     Assoc-voc          8 
     Bachelors         24 
     Doctorate          4 
     HS-grad           42 
     Masters            8 
     Prof-school        2 
     Some-college      32 

_____________________________________

### Histogram for Sex

#### Input:
https://github.com/bustammi/Analytical-Programming/blob/65e80c2a6c16a4a9f1187143dc5b214adc1fdb62/Analytical%20Programming%20Project/Analysis%20Report%20on%20Matlab%20Income.matlab#L217-L219

#### Output:
<img width="650" alt="image" src="https://user-images.githubusercontent.com/67813147/172079226-b766235c-092b-4196-917d-7be59b682826.png">

    Female       42 
    Male        101
 
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

##### Further Findings 

* Correlation Coefficient for Hours Per Week and Annual Income

``` 
    ans =
    

    1.0000    0.2110
    0.2110    1.0000
```

* Covariance for Hours Pwer Week and Annual Income

``` 
    ans = 
   1.0e+09 *

    0.0000    0.0001
    0.0001    1.1729
```

 _____________________________________
## 4th Stage: Drawing Conclusion and Inferences

* The **"correlation coefficient"** is a statistical method that measures the strength of the relationship between the relative movement of two variables, which in our case is the "annual income" and "hours worked per week."

  * According to the statistical analysis performed in UCI Income Dataset, some matrices contain values that are approximately 0.3, meaning that the 
    correlation between the "predictor" and "dependent" variable is statistically insignificant. 
    
  * The relationship between two variables becomes depicted as a "weak (positive) upward sloping linear relationship," as shown in the QQ-     plot       above.

* The **"covariance"** is a statistical method that measures how two variables change together.

  * In the case of the current dataset, most matrices are approximately 0, meaning that the "hours per work" and annual income does not vary             together.
    
 
 
### Recap for Questions Asked:
_____________________________________
**1. Are the predictor (independent variables) such as work class, education, sex, and hours worked per week interdependent?**

**Answer:**
Additional factors need to consider in testing the hypothesis that "work-class, education, sex, and hours worked per week" impacts an individual's annual income. It includes expanding the granularity of data by grouping individuals by each "state" or "city" to provide a specific context in reporting the annual income. These variables are not interdependent, meaning their values or state does not depend on each other and influence any change in values. Hence, the current dataset has limitations in its "granularity" and "faithfulness."  It does not consider socio-economic factors, such as different living and utility expenses in each state/city. 

**2. How strong is the correlation between the predictor variables and an individual's annual income (i.e., dependent variable) in the US?**

**Answer:**
According to the statistical analysis results, the correlation between "hours per week" and "annual income" is weak and a positive linear relationship since the **"correlation coefficient"** is approximately 0.3. Most predictor variables in this dataset are categorical and qualitative data leading to difficulty in measuring the strength of the relationship through quantitative measurements. Using quantitative variables such as "age" and "years of experience" might serve as better predictor variables. Its nature enables one to calculate the correlation coefficient easily. 

**3. Are two predictor variables sufficient enough to influence an individual's annual income?**

**Answer:**
**Answer:**
There might be a positive correlation, but it might be relatively weak due to different data types and contexts that become disregarded. For example, individuals who reside in "New York" or "California" might have higher annual income due to the inflation of residential housing or apartment prices and daily living expenses. In contrast, individuals who reside in "Mississippi" can take advantage of lower average housing prices. This situation could result in less "faithful" data, meaning a less accurate depiction of today's environment. Hence, a multi-variate analysis will be needed to conduct and test the Hypothesis. Do adding other predictor variables (i.e., age and years of experience) to current predictor variables result in a higher positive correlation to annual income"?

Nonetheless, the dataset lacks granularity and context in explaining the disparity in income between individuals who lived in different states. This situation means that the dataset does not have a "single source" of truth, so adding a data dictionary for predictor variables might be helpful in the long term. As previously mentioned, another factor to consider is exploring the relationship between multiple predictor variables to annual income. It requires a data type representing the strength of the relationship between various variables, such as "age" and "years of experience," rather than categorical data.
