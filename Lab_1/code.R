a <- 2 * exp(5)
b <- 2 * a
max(a, b)

help(sum)
a <- 15:25
mean(a)

apropos("sum", mode = "function")

setwd("H:/ATH/Apu/LAB/LAB1/LAB1_R")
a <- "smartfony Samsung"
save(a, file = "smartfony")
remove(a)
a

load("smartfony")
a

install.packages("gridExtra")

library(gridExtra)
help(package = "gridExtra")
grid.table(mtcars[1:10, ])

c <- seq(20, 100, 4)
rev(c)

a <- rev(5:9)
b <- 11:16
d <- c(b, 1)
d <- c(b, a)
d

nazwa <- c("Xiaomi Poco X3 PRO", "Samsung Galaxy S21", "Samsung Galaxy M12", "Samsung Galaxy M52", "Xiaomi Redmi Note 10", "Nokia G10 Dual Sim", "Xiaomi Redmi 10", "OnePlus 8T", "realme 8", "Xiaomi Redmi Note 10S")
wyswietlacz <- c(6.67, 6.2, 6.5, 6.7, 6.5, 6.5, 6.5, 6.55, 6.4, 6.43)
pamiec_RAM <- c(8, 8, 4, 6, 4, 3, 4, 8, 4, 6)
pamiec_wbudowana <- c(128, 64, 32, 64, 128, 64, 64, 128, 128, 128)
aparat_foto <- c(48.0, 12.0, 2.0, 64.0, 2.0, 13.0, 50.0, 2.0, 64.0, 2.0)
cena <- c(1399, 2799, 699, 1399, 999, 589, 799, 2099, 999, 1349)
liczba_opinii <- c(185, 106, 30, 17, 19, 17, 14, 108, 79, 27)
save.image("H:/ATH/Apu/LAB/LAB1/LAB1_R/LAB1_Workspace.RData")
smartfony <- data.frame(nazwa, wyswietlacz, pamiec_RAM, pamiec_wbudowana, aparat_foto, cena, liczba_opinii)
mean(smartfony$cena)

save.image("H:/ATH/Apu/LAB/LAB1/LAB1_R/LAB1_Workspace.RData")
smartfonybackup <- smartfony
nowysmartfon <- data.frame(nazwa ="Alcatel 1S", wyswietlacz = 6.52, pamiec_RAM = 3, pamiec_wbudowana = 32, aparat_foto = 13, cena = 449, liczba_opinii = 9)
smartfony <- rbind(smartfony, nowysmartfon)
mean(smartfony$cena)

save.image("H:/ATH/Apu/LAB/LAB1/LAB1_R/LAB1_Workspace.RData")
ocena <- c(4, 5, 4.5, 5, 5, 3.5, 3, 5, 2, 3)
smartfonybackup <- smartfony
smartfony <- cbind(smartfony, ocena)
ocena <- c(4, 5, 4.5, 5, 5, 3.5, 3, 5, 2, 3, 2)
smartfony <- cbind(smartfony, ocena)
tapply(smartfony$cena, smartfony$ocena, mean)

smartfonybackup <- smartfony
smartfon2 <- data.frame(nazwa ="Samsung Galaxy A32", wyswietlacz = 6.4, pamiec_RAM = 4, pamiec_wbudowana = 128, aparat_foto = 5, cena = 1099, liczba_opinii = 38, ocena = 5)
smartfon3 <- data.frame(nazwa ="Xiaomi Poco M4 PRO", wyswietlacz = 6.6, pamiec_RAM = 6, pamiec_wbudowana = 128, aparat_foto = 50, cena = 1199, liczba_opinii = 8, ocena = 6)
smartfon4 <- data.frame(nazwa ="realme GT Master", wyswietlacz = 6.43, pamiec_RAM = 8, pamiec_wbudowana = 256, aparat_foto = 64, cena = 1599, liczba_opinii = 147, ocena = 5)
smartfon3 <- data.frame(nazwa ="Xiaomi Poco M4 PRO", wyswietlacz = 6.6, pamiec_RAM = 6, pamiec_wbudowana = 128, aparat_foto = 50, cena = 1199, liczba_opinii = 8, ocena = 5)
smartfon5 <- data.frame(nazwa ="vivo Y33s", wyswietlacz = 6.58, pamiec_RAM = 8, pamiec_wbudowana = 128, aparat_foto = 50, cena = 999, liczba_opinii = 10, ocena = 5)
smartfony <- rbind(smartfony, smartfon2)
smartfony <- rbind(smartfony, smartfon3)
smartfony <- rbind(smartfony, smartfon4)
smartfony <- rbind(smartfony, smartfon5)
save.image("H:/ATH/Apu/LAB/LAB1/LAB1_R/LAB1_Workspace.RData")

liczebnosc <- table(smartfony$ocena)
barplot(liczebnosc)
procenty <- liczebnosc / sum(liczebnosc)
pie(procenty)
install.packages("plotrix")

library(plotrix)
fan.plot(liczebnosc, labels = names(liczebnosc))
smartfonybackup <- smartfony

grid.table(smartfony)
smartfony[, "status_opinii"] <- ifelse(smartfony$liczba_opinii == 0, "nie ma", "mniej ni¿ 50")
grid.table(smartfony)
smartfony[, "status_opinii"] <- ifelse(smartfony$liczba_opinii <= 50, smartfony$liczba_opinii, "50-100")
grid.table(smartfony)
smartfony[, "status_opinii"] <- ifelse(smartfony$liczba_opinii == 0, "nie ma", "mniej ni¿ 50")
grid.table(smartfony)
smartfony[, "status_opinii"] <- ifelse(smartfony$liczba_opinii <= 50, smartfony$status_opinii, "50-100")
grid.table(smartfony)
smartfony[, "status_opinii"] <- ifelse(smartfony$liczba_opinii > 100, "wiêcej ni¿ 100", smartfony$status_opinii)
grid.table(smartfony)
smartfony$status_opinii <- factor(smartfony$status_opinii)
pie(table(smartfony$status_opinii))

paste(smartfony$nazwa, "ma ocenê klientów", smartfony$ocena, "bo ma liczbê opinii", smartfony$liczba_opinii)

write.csv(smartfony, "smartfony_data.csv")