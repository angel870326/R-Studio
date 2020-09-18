#運用上述語法，創造出一個有2000筆資料，4個變項的資料
#此資料變項為年齡、性別、體重、婚姻狀態（單身、已婚、離婚、喪偶）

age <- sample(30:80,2000,replace = T)
gender <- sample(c("male","female"),2000,replace=T)
weight <- sample(40:90,2000,replace = T)
marital_status <- sample(c("單身","已婚","離婚","喪偶"),2000,replace=T)

mydata <- data.frame(age,gender,weight,marital_status)

head(mydata)
tail(mydata)

#計算該筆資料的年齡與體重平均數、標準差
mean(age)
mean(weight)
sd(age)
sd(weight)

#列出該筆資料的性別與婚姻狀態次數交叉表
table(gender,marital_status)








