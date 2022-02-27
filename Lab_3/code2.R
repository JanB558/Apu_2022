setwd("H:/ATH/Apu/LAB/LAB3/Workspace")
#install.packages("neuralnet")
library("neuralnet")

#ram i pamiec
traininginput <- as.data.frame(matrix(c(8,8,4,6,4,3,4,8,4,6,3,4,6,8,8,
                                        128, 64, 32, 64, 128, 64, 64, 128, 128, 128, 32, 128, 128, 256, 128), nrow=15, ncol=2))
trainingoutput <- c(1399, 2799, 699, 1399, 999, 589, 799, 2099, 999, 1349, 449, 1099, 1199, 1599, 999)

#normalizacja
maxs <- apply(traininginput,2,max)
mins <- apply(traininginput,2,min)

#konwersja do frame
scaled.traininginput <- as.data.frame(scale((traininginput), center = mins, scale = maxs - mins))

#print(head(scaled.traininginput, 15))

#po³¹czenie danych wejœciowych i wyjœciowych
trainingdata <- cbind(scaled.traininginput, trainingoutput)
trainingdata <- cbind(scaled.traininginput, as.data.frame(scale(trainingoutput, center = min(trainingoutput), scale = max(trainingoutput - min(trainingoutput)))))
colnames(trainingdata) <- c("RAM", "Pamiec", "Cena")

#print(trainingdata)

#nauczanie
net.mathfunc <- neuralnet(Cena ~ RAM+Pamiec, trainingdata, hidden = c(7,20,20,10,5), threshold = 0.001, stepmax = 1e7)

print(net.mathfunc)

#wyœwietlenie
plot(net.mathfunc)

#prognozowanie
testdata <- as.data.frame(matrix(
  c(8,8,128,64),
  nrow = 2,
  ncol = 2
))

scaled.testdata <- as.data.frame(scale(testdata, center = mins, scale = maxs - mins))

net.results <- compute(net.mathfunc, scaled.testdata)
ls(net.results)
print(net.results$net.result * max(trainingoutput - min(trainingoutput)) + min(trainingoutput))

