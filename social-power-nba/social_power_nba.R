data = read.csv("adv_stats_twitter_salary.csv")

rookies = subset(data, data$AGE <= 25)
prime = subset(data,data$AGE > 25 & data$AGE <=30 )
vets = subset(data,data$AGE >30)

m = lm(data$Salary.Millions~data$Wins.Rpm)
mR = lm(rookies$Salary.Millions~rookies$Wins.Rpm)
mP = lm(prime$Salary.Millions~prime$Wins.Rpm)
mV = lm(vets$Salary.Millions~vets$Wins.Rpm)

plot(rookies$Wins.Rpm,rookies$Salary.Millions, col="green", pch=19, 
     xlab = "Wins above Replacement", ylab = "Salary (in millions)", xlim =  c(0,20), ylim = c(0,30))
points(prime$Wins.Rpm,prime$Salary.Millions, col="yellow",pch=19)
points(vets$Wins.Rpm,vets$Salary.Millions,col="red", pch = 19)
abline(m)
abline(mR, col = "green")
abline(mP, col = "yellow")
abline(mV, col = "red")

