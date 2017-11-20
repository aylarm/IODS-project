Aylar 11/20/2017
let's start for exercise 3
math_student <- read.csv("C:\\Users\\aylar\\Desktop\\IODS-project-master\\IODS-project\\data\\student-mat.csv",header=TRUE,sep=";")
por_student <- read.csv("C:\\Users\\aylar\\Desktop\\IODS-project-master\\IODS-project\\data\\student-por.csv",header=TRUE,sep=";")
dim(math_student)
str(math_student)
dim(por_student)
str(por_student)


install.packages("dplyr")
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")
join_by
math_por <- inner_join (math_student, por_student, by = join_by ,suffix = c(".math", ".por"))
colnames(math_por)

glimpse(math_por)
str(math_por)
dim(math_por)
alc <- select(math_por, one_of(join_by))
notjoined_columns <- colnames(math_student)[!colnames(math_student) %in% join_by]
notjoined_columns
for(column_name in notjoined_columns) {
two_columns <- select(math_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
  if(ialc[column_name] <- round(rowMeans(two_columns))
  } else { 
alc[column_name] <- first_column
  }
}
glimpse(alc)
alc <- select(math_por, one_of(join_by))
for(column_name in notjoined_columns) {
two_columns <- select(math_por, starts_with(column_name))
first_column <- select(two_columns, 1)[[1]]
if(is.numeric(first_column)) {
alc[column_name] <- round(rowMeans(two_columns))
} else {
alc[column_name] <- first_column
}
}

alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)
g1 <- ggplot(data = alc, aes(x = alc_use, fill = sex))
g1 + geom_bar()
alc <- mutate(alc, high_use = alc_use > 2)
g2 <- ggplot(alc, aes(high_use))
g2 + facet_wrap("sex") + geom_bar()
install.packages("tidyverse")
install.packages("dplyr")
glimpse(alc) 
gather(alc) %>% glimpse

write.csv(alc,file = "alc.csv")
