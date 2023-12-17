---
title: "Experiment 2"
output: html_notebook
---

```{r}
library(LearnBayes)
```
## Prior Data
```{r echo=TRUE}
p = seq(0.05, 0.95, by=0.1)
prior = c(1, 4.2, 9, 7.2, 4.6, 2.1, 0.7, 0.1, 0, 0)
prior = prior / sum(prior)
plot(p, prior, type="h", ylab="Prior Probability")
```
## Posterior
```{r}
data = c(13, 14)
post = pdisc(p, prior, data) 
round(cbind(p, prior, post), 2) 
```
```{r}
library(lattice)
prior_data = data.frame("Prior", p, prior)
post_data = data.frame("Post", p, post)

names(prior_data) = c("Type", "P", "Probability") 
names(post_data) = c("Type","P","Probability")

data = rbind(prior_data, post_data)

xyplot(Probability ~ P | Type, data=data, layout=c(1, 2), type="h")
```
## Beta Prior
```{r}
q1 = list(p=.5, x=.3)
q2 = list(p=.9, x=.5)
(ab <- beta.select(q1, q2))
```
```{r fig.show='hold'}
a = ab[1]
b = ab[2]
s = 13
f = 14

curve(dbeta(x, a + s, b + f), from=0, to=1, xlab="p", ylab="Density", lty=1, lwd=4) 
curve(dbeta(x, s + 1, f + 1), add=TRUE, lty=2, lwd=4)
curve(dbeta(x, a, b), add=TRUE, lty=3, lwd=4)
legend(.7, 4, c("Prior", "Likelihood", "Posterior"), lty=c(3, 2, 1), lwd=c(3, 3, 3)) 
```

```{r}
curve(dbeta(x, a + s, b + f)) 
curve(dbeta(x, s + 1, f + 1),add=TRUE)
curve(dbeta(x, a, b),add=TRUE)
```


## Posterior Summaries
```{r}
1 - pbeta(0.5, a + s, b + f)
```
```{r}
qbeta(c(0.05, 0.95), a + s, b + f)
```
```{r}
ps = rbeta(1000, a + s, b + f)
hist(ps, xlab="p")
```
## Histogram Prior
```{r}
midpt = seq(0.05, 0.95, by=0.1)
prior = c(1, 4.2, 9, 7.2, 4.6, 2.1, 0.7, 0.1, 0, 0)
prior = prior / sum(prior)
```
```{r}
curve(histprior(x, midpt, prior), from=0, to=1, ylab="Prior density", ylim=c(0, .4))
curve(histprior(x, midpt, prior))
```



```{r}
curve(histprior(x,midpt,prior) * dbeta(x, s + 1, f + 1), from=0, to=1, ylab="Posterior density")
```
```{r}
p = seq(0, 1, length=500) 
post = histprior(p, midpt, prior) * dbeta(p, s + 1, f + 1) 
post = post / sum(post) 
ps = sample(p, replace = TRUE, prob = post) 

hist(ps, xlab="p", main="")
```
## Prediction
```{r}
p = seq(0.05, 0.95, by=.1) 

prior = c(1, 4.2, 9, 7.2, 4.6, 2.1, 0.7, 0.1, 0, 0)

prior = prior / sum(prior) 

m = 20 
ys = 0:20 
pred = pdiscp(p, prior, m, ys) 

cbind(0:20, pred) 
```
```{r}
ab = c(3.26, 7.19) 
m = 20 
ys = 0:20 

pred = pbetap(ab, m, ys)
```

```{r}
p = rbeta(1000, 3.26, 7.19)
y = rbinom(1000, 20, p) 
table(y) 
```
```{r}
freq = table(y) 
ys = as.integer(names(freq)) 
predprob = freq / sum(freq) 
plot(ys, predprob, type="h", xlab="y", ylab="Predictive Probability") 
```
```{r}
dist = cbind(ys, predprob)
covprob = .9
discint(dist, covprob)
```

