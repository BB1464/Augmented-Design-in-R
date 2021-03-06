

###########################################################################
###########################################################################
###                                                                     ###
###                             DATA IMPORT                             ###
###                                                                     ###
###########################################################################
###########################################################################

library(readxl)
library(dplyr)
library(janitor)

Augmented <- read_excel("Augmented.xlsx")


###########################################################################
###########################################################################
###                                                                     ###
###                        AUGMENTED DESIGN IN R                        ###
###                                                                     ###
###########################################################################
###########################################################################

library(agricolae)

Augmented <- clean_names(Augmented)

Genotype <- c(Augmented$vi_no)


Checks <- c('TPT-11','TPT-12','TPT-16')

FieldPlan <- design.dau(trt1 = Checks,trt2 = Genotype,r = 8,seed = 100,randomization = TRUE,name = 'Treatment')


Plan <- FieldPlan$book


# All duplicated elements
Augmented %>%
  filter(vi_no %in% unique(.[["vi_no"]][duplicated(.[["vi_no"]])]))



write.csv(x = Plan,'FieldPlan.csv',row.names = FALSE)



# Create a character vector of length 1:10 for Genotype

Genotype <- paste('G',sep = '',1:10)
