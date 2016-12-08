library(MASS)
rlm_mod <- rlm(stack.loss ~ ., stackloss, psi = psi.bisquare)  # robust reg model
summary(rlm_mod)
#> Call: rlm(formula = stack.loss ~ ., data = stackloss)
#> Residuals:
#>      Min       1Q   Median       3Q      Max 
#> -8.91753 -1.73127  0.06187  1.54306  6.50163 
#> 
#> Coefficients:
#>             Value    Std. Error t value 
#> (Intercept) -41.0265   9.8073    -4.1832
#> Air.Flow      0.8294   0.1112     7.4597
#> Water.Temp    0.9261   0.3034     3.0524
#> Acid.Conc.   -0.1278   0.1289    -0.9922
#> 
#> Residual standard error: 2.441 on 17 degrees of freedom

lm_mod <- lm(stack.loss ~ ., stackloss)  # lm reg model

# Errors from lm() model
install.packages("DMwR")
DMwR::regr.eval(stackloss$stack.loss, lm_mod$fitted.values)
#>       mae       mse      rmse      mape 
#> 2.3666202 8.5157125 2.9181694 0.1458878

# Errors from rlm() model
DMwR::regr.eval(stackloss$stack.loss, rlm_mod$fitted.values)
#>       mae       mse      rmse      mape 
#> 2.1952232 9.0735283 3.0122298 0.1317191

