aylaranalysis <- read.csv("learning2014.csv")
str(aylaranalysis)
dim(aylaranalysis)
summary(aylaranalysis)
p1 <- ggplot(aylaranalysis, aes(Attitude, Points))

p2 <- p1 + geom_point()
p2
p3 <- p2 + geom_smooth(method = "lm")
pairs(aylaranalysis[-1])


qplot(Attitude, Points, data = aylaranalysis) + geom_smooth(method = "lm")
aylaranalysis_model <- lm(Points ~ Attitude + stra + surf, aylaranalysis)
summary(aylaranalysis_model)
hist(aylaranalysis$Attitude)
p <- ggpairs(aylaranalysis, aes(Points,Attitude), lower = list(combo = wrap("facethist", bins = 10)), upper = list(continuous = wrap("cor", size=3)))
p
my_model2 <- lm(Points ~ Attitude + stra,  data = aylaranalysis)
summary(my_model2)
my_model2 <- lm(Points ~ Attitude + stra, data = aylaranalysis)
par(mfrow = c(2,5))
plot(2,5)