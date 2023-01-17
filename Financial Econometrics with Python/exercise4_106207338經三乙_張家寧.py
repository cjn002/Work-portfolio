## Question 1
import wooldridge as woo
import statsmodels.formula.api as smf
import scipy.stats as stats

## Import data
vote1 = woo.dataWoo('vote1')

## a. What is the interpretation of beta1?
## Answer: 當lexpendA增加1，voteA的變動量為(beta1/100)%


## b. In terms of the parameters, state the null hypothesis that a 1% increase in A's expenditure is 
## offset by a 1% increase in B's expenditure
## Answer: H0:beta1 = -beta2

## c. Descriptive statistics
vote1[['voteA','lexpendA','lexpendB','prtystrA']].describe()

## d. Fit the regression 
reg = smf.ols(formula = 'voteA ~ lexpendA+lexpendB+prtystrA', data = vote1)
results = reg.fit()

print(f'results.summary():\n{results.summary()}\n')

## e The null that beta1 + beta 2 = 0
## Use method f_test
hypotheses = ['lexpendA=-lexpendB']
ftest = results.f_test(hypotheses)
fstat = ftest.statistic[0][0]             ## Extract the F statistic
fpval = ftest.pvalue                      ## Extract the p-value

print(f'fstat: {fstat}\n')
print(f'fpval: {fpval}\n')

## Estimate a modified model
vote1['lA_lB'] = vote1['lexpendA'] - vote1['lexpendB']
reg_mod = smf.ols(formula = 'voteA ~ lA_lB+prtystrA', data = vote1)
results_mod = reg_mod.fit()
print(f'results_mod.summary():\n{results_mod.summary()}\n')

## Verify whether t^2 = F
tvalues = results_mod.t_test(hypotheses)
tvalues_sq = tvalues['lA_lB']**2
print(round(tvalues_sq,4), round(fstat,4))

## f. How can you test beta1 + beta2 = 1.5
## Use the method f_test
hypotheses = ['lexpendA+lexpendB=1.5']
ftest = results.f_test(hypotheses)
fstat = ftest.statistic[0][0]              ## Extract the F statistic
fpval = ftest.pvalue                      ## Extract the p-value  

print(f'fstat: {fstat}\n')
print(f'fpval: {fpval}\n')

## Estimate a modified model
vote1['lA_lB'] = vote1['lexpendA'] - vote1['lexpendB'] -1.5
reg_mod = smf.ols(formula = 'voteA ~ lA_lB+prtystrA', data = vote1)
results_mod = reg_mod.fit()
print(f'results_mod.summary():\n{results_mod.summary()}\n')

## Calculate t statistic
n = vote1.shape[0]
k = 3
df = n-k-1
b_lexpendA = results_mod.params['lA_lB']
se_lexpendA = results_mod.bse
tstat = round((b_lexpendA - 1.5) / se_lexpendA, 3)
tpval = 2*stats.t.cdf(-abs(tstat), df = df)

print(f'tstat: {tstat}\n')
print(f'tpval: {tpval}\n')                  ## should be the same value as fpval

## Use method t_test
hypothesis = ['lexpendA+lexpendB=1.5']
ttest = results_mod.t_test(hypothesis)
tstat = ttest.statistic[0][0]
tpval = ttest.pvalue

print(f'tstat: {tstat}\n')
print(f'tpval: {tpval}\n')                  ## should be the same value as fpval

## -----------------------------------------------------------------------
## Question 2
import wooldridge as woo
import numpy as np
import statsmodels.formula.api as smf
import scipy.stats as stats

## Import data
hprice1 = woo.dataWoo('hprice1')

## a. Descriptive statistics
hprice1[['price','sqrft','bdrms']].describe()

## b. Fit the regression
reg = smf.ols(formula = 'np.log(price)~sqrft+bdrms', data = hprice1)
results = reg.fit()
print(f'results.summary():\n{results.summary()}\n')
## Estimate theta1
theta1 = hprice1['sqrft'] + 150
theta1 = round(theta1, 4)
print(f'theta1:\n{theta1}\n')

## c. Calculate standard error of theta1 and construct CI's
hprice1['new_var'] = hprice1['price']  - hprice1['sqrft'] 
reg_mod = smf.ols(formula = 'np.log(new_var)~sqrft+bdrms', data = hprice1)
results_mod = reg_mod.fit()

bse = results_mod.bse
n = hprice1.shape[0]
k = 2
df = n - k - 1
cv_005 = stats.t.ppf(1 - 0.05/2, df = df)    ## Critical value for 95% CI 
cv_001 = stats.t.ppf(1 - 0.01/2, df = df)    ## Critical value for 99% CI

ci_005_up = results_mod.params['bdrms'] + cv_005*bse
ci_005_low = results_mod.params['bdrms'] - cv_005*bse
ci_005 = [round(ci_005_low, 4), round(ci_005_up, 4)]
print(f'ci_005:\n{ci_005}\n')

ci_001_up = results_mod.params['bdrms']  + cv_001*bse
ci_001_low = results_mod.params['bdrms'] - cv_001*bse
ci_001 = [round(ci_001_low, 4), round(ci_001_up, 4)]
print(f'ci_001:\n{ci_001}\n')

## ---------------------------------------------------------------------
## Question 3
## A simulation for examing confidence intervals
import statsmodels.formula.api as smf
import scipy.stats as stats
import pandas as pd
import numpy as np

## Set sample size and number of iterations:
n = 300
r = 50

## Set true parameters
beta0 = 0.4
beta1 = -1.46
beta2 = 2.5

df = n - 2 - 1
cv_005 = stats.t.ppf(1 - 0.05/2, df = df)                ## Critical value for 95% CI
cv_001 = stats.t.ppf(1- 0.01/2, df = df)                ## Critical value for 99% CI

## Create empty vectors to store the simulation results
beta0_result_005 = np.empty(r)                 
beta1_result_005 = np.empty(r)  
beta2_result_005 = np.empty(r)  

beta0_result_001 = np.empty(r)  
beta1_result_001 = np.empty(r)  
beta2_result_001 = np.empty(r)  

np.random.seed(1234567)

## Generate samples of x1 and x2
x1 = stats.uniform.rvs(size = n)
x2 = stats.norm.rvs(loc = 0.78, size = n)

for i in range(r):
    
    u = stats.norm.rvs(loc = 0, size = n)              ## Generate u
    y = 0.4 - 1.46*x1 + 2.5*x2 + u    ## Generate y
    datax = pd.DataFrame({'y':y, 'x1':x1, 'x2':x2}) 
    
    reg = smf.ols(formula = 'y~x1+x2',data=datax)
    results = reg.fit()
    beta_hat = results.params
    bse = results.bse
    
    ## Whether the true parameters lie in the 95% CI's?
    beta0_result_005[i] = (beta0 >= (beta_hat['Intercept'] - cv_005*bse['Intercept'])) and (beta0 <= (beta_hat['Intercept'] + cv_005*bse['Intercept']))
    beta1_result_005[i] = (beta1 >= (beta_hat['x1'] - cv_005*bse['x1'])) and (beta1 <= (beta_hat['x1'] + cv_005*bse['x1']))
    beta2_result_005[i] = (beta2 >= (beta_hat['x2'] - cv_005*bse['x2'])) and (beta2 <= (beta_hat['x2'] + cv_005*bse['x2']))
    
    ## Whether the true parameters lie in the 95% CI's?
    beta0_result_001[i] = (beta0 >= (beta_hat['Intercept'] - cv_001*bse['Intercept'])) and (beta0 <= (beta_hat['Intercept'] + cv_001*bse['Intercept']))
    beta1_result_001[i] = (beta1 >= (beta_hat['x1'] - cv_001*bse['x1'])) and (beta1 <= (beta_hat['x1'] + cv_001*bse['x1']))
    beta2_result_001[i] = (beta2 >= (beta_hat['x2'] - cv_001*bse['x2'])) and (beta2 <= (beta_hat['x2'] + cv_001*bse['x2']))


## Print out the results
print(np.mean(beta0_result_005), np.mean(beta1_result_005), 
      np.mean(beta2_result_005))
print(np.mean(beta0_result_001), np.mean(beta1_result_001), 
      np.mean(beta2_result_001))
## 0.98 0.96 0.92
## 1.0 1.0 1.0

## Repeat the simulations with the number of iterations equal to 200
## Print out your answers

## 0.94 0.965 0.935
## 0.995 1.0 0.995

## Repeat the simulations with the number of iterations equal to 1000
## Print out your answers

## 0.947 0.95 0.951
## 0.994 0.994 0.994







