noNullInsGluBMI <- as_tibble(read.csv('noNullInsGluBMI.csv'))

result <- lm(Glucose ~ Pregnancies + BloodPressure + SkinThickness + Insulin + BMI + DiabetesPedigreeFunction + Age, data=noNullInsGluBMI)
summary(result)

yhat <- result$fitted.values
res <- result$residuals
noNullInsGluBMI <- data.frame(noNullInsGluBMI, yhat, res)

ggplot(noNullInsGluBMI, aes(x = yhat,y = res))+
  geom_point()+
  geom_hline(yintercept=0, color="red")+
  labs(x="Fitted y",
       y="Residuals",
       title="Residual Plot")

boxcox(result)
acf(res, main = "ACF Plot of Residuals")
qqnorm(res)
qqline(res, col = "red")

# Transforming y into ystar by taking the log of y
ystar <- log((noNullInsGluBMI$Glucose))
noNullInsGluBMI <- data.frame(noNullInsGluBMI, ystar)
result.ystar <- lm(ystar ~ Pregnancies + BloodPressure + SkinThickness + Insulin + BMI + DiabetesPedigreeFunction + Age, data=noNullInsGluBMI)
summary(result.ystar)

yhat2 <- result.ystar$fitted.values
res2 <- result.ystar$residuals
noNullInsGluBMI <- data.frame(noNullInsGluBMI, yhat2, res2)

ggplot(noNullInsGluBMI, aes(x = yhat2,y = res2))+
  geom_point()+
  geom_hline(yintercept=0, color="red")+
  labs(x="Fitted y",
       y="Residuals",
       title="Residual Plot")

boxcox(result.ystar)
acf(res2, main = "ACF Plot of Residuals")
qqnorm(res2)
qqline(res2, col = "red")s
