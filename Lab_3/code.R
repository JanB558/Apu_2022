setwd("H:/ATH/Apu/LAB/LAB3/Workspace")
#install.packages("neuralnet")
library("neuralnet")

seq <- 1:100
res <- vector()
for(x in seq) { res<-append(res, x^3 + 2*x) }

traininginput <- as.data.frame(matrix(seq, nrow=100, ncol=1))
trainingoutput <- res

#normalizacja
maxs <- max(traininginput)
mins <- min(traininginput)

#konwersja do frame
scaled.traininginput <- as.data.frame(scale((traininginput), center = mins, scale = maxs - mins))

#print(head(scaled.traininginput, 100))

#połączenie danych wejściowych i wyjściowych
#trainingdata <- cbind(scaled.traininginput, trainingoutput)
trainingdata <- cbind(scaled.traininginput, trainingoutput)
trainingdata <- cbind(scaled.traininginput, as.data.frame(scale(trainingoutput, center = min(trainingoutput), scale = max(trainingoutput - min(trainingoutput)))))
colnames(trainingdata) <- c("In", "Out")

print(trainingdata)

#nauczanie
net.mathfunc <- neuralnet(Out ~ In, trainingdata, hidden = c(10,10,10,10), threshold = 0.0001, stepmax = 1e7)

print(net.mathfunc)

#wyświetlenie
plot(net.mathfunc)

#prognozowanie
testdata <- as.data.frame(matrix(
  c(100, 101),
  nrow = 2,
  ncol = 1
))

scaled.testdata <- as.data.frame(scale(testdata, center = mins, scale = maxs - mins))

net.results <- compute(net.mathfunc, scaled.testdata)
ls(net.results)
print(net.results$net.result * max(trainingoutput - min(trainingoutput)) + min(trainingoutput))
