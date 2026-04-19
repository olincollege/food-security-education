library(readr)


df_23_24 <- read_csv("data/raw/2023-2024_NSCH_Topical_CAHMI_DRC.csv")
df_21_22 <- read_csv("data/raw/2021-2022 NSCH_Topical_DRC_CAHMI_v3.csv")
df_20 <- read_csv("data/raw/NSCH_2020e_Topical_CAHMI_DRCv3.csv")
df_18_19 <- read_csv("data/raw/NSCH_2018e_2019e_Topical_CAHMI_DRCv3.csv")


names(df_21_22)
names(df_23_24)
names(df_18_19)
names(df_20)