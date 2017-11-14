#aylar 11.13.2017 
#this is aylar script file
# IMPORT datasets #
lrn14 <- read.csv(url("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt"),header = TRUE,sep = "\t")

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <-rowMeans(deep_columns)

surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")
learning2014 <- select(lrn14, one_of(keep_columns))
learning2014 <- filter(learning2014, Points != 0)


write.csv(learning2014,"learning2014.csv")

proofaylarcan <- read.csv("learning2014.csv")
str(proofaylarcan)
head(proofaylarcan)