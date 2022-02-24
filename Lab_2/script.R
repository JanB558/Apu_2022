setwd("H:/ATH/Apu/LAB/LAB2/Workspace")

install.packages("data.tree")
install.packages("DiagrammeR")
install.packages("formattable")
install.packages("H:/ATH/Apu/LAB/LAB2/Workspace/ahp_0.2.12.tar.gz",repos=NULL,type = "source")

install.packages("devtools", dependencies = TRUE)
library(devtools)
devtools::install_github("gluc/ahp", build_vignettes = TRUE)
install.packages("data.tree")
library(ahp)
library(data.tree)

ahpData <- Load("H:/ATH/Apu/LAB/LAB2/Workspace/smartphonesahp.ahp")
Calculate(ahpData)
Visualize(ahpData)
Analyze(ahpData)
AnalyzeTable(ahpData)