hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
str(hd)
dim(hd)
str(gii)
dim(gii)
summary(hd)
summary(gii)
options(StringsAsFactors=FALSE)
gii_cols = c(
  "hdi_rank", "country", "GII_2012", "maternal_mortality_ratio",
  "adolescent_fertility_rate_gii", "seats_parlim_female_gii",
  "seats_parlim_female_note", "secondary_education_female",
  "secondary_education_female_note", "secondary_education_male",
  "secondary_education_male_note", "labor_participation_female_gii",
  "labor_participation_male_gii"
)
df_all = tbl_df(read.csv('http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv"', col.names=gii_cols,
                         na.strings='..'))
df_all = df_all %>% select(-hdi_rank, -seats_parlim_female_note,
                           -secondary_education_female_note,
                           -secondary_education_male_note)
 inner_join(hd,gii)
 rownames(df_all) = df_all$Country
 region_info = read.delim('http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv')
 region_names = read.csv('http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv')
 region_info$region = region_names$Region[match(region_info$region.code,
                                                region_names$M49.numeric.code)]
 regions = region_info$region[match(df_all$Country, region_info$name)]
 country_names = as.character(df_all$Country)
 df_all = df_all %>% select(-Country)
 
 print("Number of missing df_allapoints for each variable:")
 apply(df_all, 2, function (x) {sum(is.na(x))})
 print("Countries with missing data:")
 country_names[!complete.cases(df_all)]
 human <-df_all
 human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)
 names(human)
 library(stringr)
 str(human$GNI)
 str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric
 keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
 human <- select(human, one_of(keep))
 complete.cases(human)
 data.frame(human[-1], comp = complete.cases(human))
 human_ <- filter(human, complete.cases(human))
 tail(human, 10)
 last <- nrow(human) - 7
 human_ <- human[1:last, ]
 rownames(human) <- human$Country
 library(dplyr)
 human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)
 human$GNI <- gsub(",", "", human$GNI) %>% as.numeric
 keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
 human <- select(human, one_of(keep))
 human <- filter(human, complete.cases(human))
 rownames(human) <- human$Country
 last <- nrow(human) - 7
 human <- human[1:last, ]
 human_ <- select(human, -Country)
 library(GGally)
 
 ggpairs(human_)
 cor(human_) %>% corrplot
 
 
 cor(human_) %>% corrplot
 