#Exercise 8
##Q1:Create a line chart showing the growing score of a basketball game

#first we need to read in the score data using the read.table function 
data=read.table("C:/Users/azach/OneDrive/Desktop/R Data/UWvMSU_1-22-13.txt", header = TRUE, stringsAsFactors = FALSE)
data

#create output variables(needs to be a matrix)
outputdf<- data.frame(matrix(ncol = 3, nrow = 50))
x<-c("time", "UW score", "MSU score")
colnames(outputdf)<-x
#for loop to read through the lines of the file
#if else statement to add cumulative sum
outputdf[1,]<-c(0,0,0)

for(i in 2:nrow(data)){
  if (data$team[i]=="UW"){
    outputdf$time[i] <- data$time[i] 
    outputdf$`UW score`[i]<- outputdf$`UW score`[i-1]+data$score[i]
    outputdf$`MSU score`[i]<- outputdf$`MSU score`[i-1]
    #create cumulative sum if UW is scoring
    #2) need to pull value from the previous row of the outputdf
  }
  else{
    outputdf$time[i]<-data$time[i] 
    outputdf$`MSU score`[i]<-outputdf$`MSU score`[i-1]+data$score[i]
    outputdf$`UW score`[i]<- outputdf$`UW score`[i-1]
  }
  
}

#then create plots
#plot(x,y,type='1')
#line(x,y)
plot(outputdf$time,outputdf$`UW score`,type='l', col='red')
lines(outputdf$time, outputdf$`MSU score`, col='green') 





#Q2: 
intro<-("I'm thinking of a number 1-100")
print(intro)
x<-sample(1:100, 1) #this generates a random number between 1 and 100
for (i in 1:10){ #Doing a for loop allows you to interact with the code as it runs instead of running it line by line
  guess<-readline(prompt = "Guess:") #This stores each guess so it can be compared to the randomly generate number  
if (guess<x) { 
  print("Higher")
} else if(guess>x) {
    print("Lower")
} else {
    print("Correct!")
  }
}

#I'm not sure how to "end" the for loop if the player guesses correctly before 10 guesses, though.

