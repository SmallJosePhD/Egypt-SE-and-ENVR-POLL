###############################################################################
#
#'The nonlinear relationship between environmental pollution and shadow economy in Egypt: Evidence from Bootstrap ARDL technique
###############################################################################

# MASTER SCRIPT

################################################################################

# This is a master script that calls other scripts one-by-one
# To replicate the unit root tests (ADF, KPSS, ZA and LS), and the plots of dynamic ARDL simulation discussed in the paper.


#First let's check if the directory where we want to save our R codes exist, if not we creat one.
if(!dir.exists("R")) {
  dir.create("R")
}



## Step 1: Package Installation -------------------------
source("R/01_packages_install.R")

## Step 2: ARDL bounds-testing estimation --------
source ("R/02_ardl_bounds_testing.R")

## Step 3: Dynamic ARDL Simulation --------
source ("R/03_dynamic_ardl_simulation.R")
