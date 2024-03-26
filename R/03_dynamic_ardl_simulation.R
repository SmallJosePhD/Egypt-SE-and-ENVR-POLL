##############################################################################
#'The nonlinear relationship between environmental pollution and shadow economy in Egypt: Evidence from Bootstrap ARDL technique
#' 
##############################################################################
#'Let's first import the data used from "Data" folder
myData <- read_excel("Data/myData.xlsx", sheet=1)


##############################################################################
# DYNAMIC ARDL SIMULATION
##############################################################################
#first set a seed
set.seed(200)



##############################################################################
#Simulation for changes in shadow economy
##############################################################################

#Simulation for shadow economy (1 standard deviation increase)

dynardl.model_se1 <- dynardl(co2_pc ~ se_pos + se_neg + kofgi + lpcy + urb_g + ind_g, data = myData,
                         lags = list("co2_pc" = 1, "se_pos" = 1, "se_neg" = 1, "lpcy" = 1, "urb_g" = 1, "ind_g" =1),
                         levels = c("kofgi"),
                         diffs = c("se_pos", "se_neg", "lpcy", "urb_g", "ind_g"),
                         lagdiffs = list("co2_pc" = 1, "se_pos" =c(1:2), "lpcy" =c(1:2)),
                        ec = T,
                        simulate =T,
                        shockvar = "se_pos",
                        time = 10,
                        sim = 10000,
                        range = 50,
                        fullsims = TRUE)


#Generate the spike plot
dynardl.simulation.plot(dynardl.model_se1, 
                        type = "spike",
                        response = "levels",
                        bw = F,
                        xlab = "Years",
                        ylab = "Predicted CO2 Emission in metric tons per capita",
                        #main = "Plot of a counterfactual shock in predicted CO2 emission (in metric tons per capita) following \n a percent increase in the size of shadow economy (% of GDP)", cex.main =.9,
                        xaxt = "n")
#Create a-axis limits
axis(1, c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50),
     labels = c(2022, 2026, 2031, 2035, 2041, 2046, 2051, 2056, 2061, 2066, 2071))

#Add gridlines
grid(nx = NA, ny = NULL, lwd = 0.091, lty= "solid", col = "lightgrey")

#Let's save this
png('Graphs/se increase.png')


##############################################################################


#Simulation for shadow economy (1 standard deviation rduction)

dynardl.model_se2 <- dynardl(co2_pc ~ se_pos + se_neg + kofgi + lpcy + urb_g + ind_g, data = myData,
                             lags = list("co2_pc" = 1, "se_pos" = 1, "se_neg" = 1, "lpcy" = 1, "urb_g" = 1, "ind_g" =1),
                             levels = c("kofgi"),
                             diffs = c("se_pos", "se_neg", "lpcy", "urb_g", "ind_g"),
                             lagdiffs = list("co2_pc" = 1, "se_pos" =c(1:2), "lpcy" =c(1:2)),
                             ec = T,
                             simulate =T,
                             shockvar = "se_neg",
                             time = 10,
                             sim = 10000,
                             range = 50,
                             fullsims = TRUE)


#Generate the spike plot
dynardl.simulation.plot(dynardl.model_se2, 
                        type = "spike",
                        response = "levels",
                        bw = F,
                        xlab = "Years",
                        ylab = "Predicted CO2 Emission in metric tons per capita",
                        #main = "Plot of a counterfactual shock in predicted CO2 emission (in metric tons per capita) following \n a percent increase in the size of shadow economy (% of GDP)", cex.main =.9,
                        xaxt = "n")
#Create a-axis limits
axis(1, c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50),
     labels = c(2022, 2026, 2031, 2035, 2041, 2046, 2051, 2056, 2061, 2066, 2071))

#Add gridlines
grid(nx = NA, ny = NULL, lwd = 0.091, lty= "solid", col = "lightgrey")

#Let's save this
png('Graphs/se decrease.png')


##############################################################################