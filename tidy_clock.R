library(tidyverse)
library(DunedinPoAm38)
# Tidy format
# A tibble: 94 x 3
#    term          estimate penalty
#    <chr>            <dbl>   <dbl>
#  1 (Intercept)   -3.38      0.629
#  2 cg19383211     0.00173   0.629
#  3 cg08269402     1.37      0.629
#  4 cg24631222    30.0       0.629
#  5 cg23270113    -1.65      0.629

# Read raw clock dara
hor = read_csv("raw_data/Horvath_clock_353_CpGs.csv") %>%
  select(CpGmarker, CoefficientTraining)
lev = read_csv("raw_data/DNAmPhenoAge.csv") %>%
  select(CpG, Weight)
lev[1,1] = "(Intercept)"
mPOA = tibble(term = "(Intercept)", estimate = mPOA_Models$model_intercept[[1]]) %>%
  rbind(tibble(term = names(mPOA_Models$model_weights$DunedinPoAm_38), estimate = mPOA_Models$model_weights$DunedinPoAm_38))

colnames(hor) = colnames(lev) = colnames(mPOA)

write_csv(hor, "HorvathAge.csv")
write_csv(lev, "PhenoAge.csv")
write_csv(mPOA, "DunedinPoAmAge.csv")
