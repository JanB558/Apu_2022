setwd("H:/ATH/Apu/LAB/LAB4/Workspace")

#install.packages("C50")
library(C50)

smartphones <- read.csv("smartfony_data.csv")

#print(smartphones)

smartdata <- data.frame(smartphones$wyswietlacz, smartphones$pamiec_RAM, smartphones$pamiec_wbudowana, smartphones$aparat_foto, smartphones$ocena)

#print(smartdata)

#write.csv(smartdata, 'smartdata.csv')
#smartdata <- read.csv('smartdata.csv')

#convert to factor
smartdata$smartphones.ocena <- as.factor(smartdata$smartphones.ocena)
smartdata$smartphones.wyswietlacz <- as.factor(smartdata$smartphones.wyswietlacz)
smartdata$smartphones.pamiec_RAM <- as.factor(smartdata$smartphones.pamiec_RAM)
smartdata$smartphones.pamiec_wbudowana <- as.factor(smartdata$smartphones.pamiec_wbudowana)
smartdata$smartphones.aparat_foto <- as.factor(smartdata$smartphones.aparat_foto)

#build model
#tree <- C5.0(smartphones.ocena ~ ., data = smartdata)
tree <- C5.0(x=smartdata[,-5], y=smartdata[,5])
#tree <- C5.0(x=smartdata[,-1], y=smartdata[,1])

summary(tree)

#plot
plot(tree)

#make predictions
table(predict(tree, newdata=smartdata), smartdata$smartphones.ocena)

