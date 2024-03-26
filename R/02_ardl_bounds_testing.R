##############################################################################
#'The nonlinear relationship between environmental pollution and shadow economy in Egypt: Evidence from Bootstrap ARDL technique 

#' 
##############################################################################

# ARDL BOUNDS TESTING

##############################################################################

#Estimate Unrestricted ARDL

dynardl.model <- dynardl(co2_pc ~ se_pos + se_neg + kofgi + lpcy + urb_g + ind_g, data = myData, 
                         lags = list("co2_pc" = 1, "se_pos" = 1, "se_neg" = 1, "lpcy" = 1, "urb_g" = 1, "ind_g" =1),
                         levels = c("kofgi"),
                         diffs = c("se_pos", "se_neg", "lpcy", "urb_g", "ind_g"),
                         lagdiffs = list("co2_pc" = 1, "se_pos" =c(1:2), "lpcy" =c(1:2)),
                         ec = T, simulate =F)

print(summary(dynardl.model))



##############################################################################

#POST ESTIMATION TESTS AND BOUNDS TESTING

##############################################################################

#Post estimation tests
print(dynardl.auto.correlated(dynardl.model))


#Cointegration test: PSS bounds testing for case II
print(pssbounds(dynardl.model, restriction = TRUE))

#Note you need to unload nardl package (if loaded) else it will not work


##############################################################################
