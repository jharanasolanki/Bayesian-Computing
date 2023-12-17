---
title: "Experiment 1"
output: html_notebook
---


```{r}
library("LearnBayes")
data(studentdata)
```

```{r}
print(studentdata[1:10,])
```

```{r}
table(studentdata$Gender)
```

```{r}
table(studentdata$Height)
```

```{r}
table(studentdata$Drink)
```

```{r}
barplot(table(studentdata$Drink), xlab = "Drink", ylab = "Count")
barplot(table(studentdata$Gender))
```

```{r}
hours_of_sleep = studentdata$WakeUp - studentdata$ToSleep
summary(hours_of_sleep)
```

```{r}
hist(hours_of_sleep, main="")
hist(table(studentdata$Gender),main = "")
```

```{r}
boxplot(hours_of_sleep ~ studentdata$Gender, ylab="Hours of Sleep")
boxplot(table(studentdata$Height))
```

```{r}
female_haircut = studentdata$Haircut[studentdata$Gender == "female"]
male_haircut = studentdata$Haircut[studentdata$Gender == "male"]
```

```{r}
summary(female_haircut)
```

```{r}
summary(male_haircut)
```

```{r}
hist(studentdata$Dvds)
```

```{r}
barplot(studentdata$Dvds)
```

```{r}
boxplot(studentdata$Height ~ studentdata$Gender)
```