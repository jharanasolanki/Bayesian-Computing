```{r}
library(LearnBayes)
```

```{r}
d <- list(int.lo=c(-Inf, seq(66, 74, by=2)),
        int.hi=c(seq(66, 74, by=2), Inf),
        f=c(14, 30, 49, 70, 33, 15))
```

```{r}
y <- c(rep(65,14), rep(67,30), rep(69,49),
       rep(71,70), rep(73,33), rep(75,15))
mean(y)
```

```{r}
log(sd(y))
```

```{r}
start <- c(70, 1)
fit <- laplace(groupeddatapost, start, d)
fit
```

```{r}
modal.sds <- sqrt(diag(fit$var))
proposal <- list(var=fit$var, scale=2)
fit2 <- rwmetrop(groupeddatapost,proposal,start,10000, d)
fit2$accept
```
```{r}
mycontour(groupeddatapost,
          c(69, 71, .6, 1.3), d,
       xlab="mu",ylab="log sigma")
points(fit2$par[5001:10000, 1],
       fit2$par[5001:10000, 2])
```
```{r}
barplot(fit$var)
```




