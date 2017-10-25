Quiz
====

Question 1
----------

Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:

	library(datasets)
	data(iris)

A description of the dataset can be found by running

	?iris

There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? (Please only enter the numeric result and nothing else.)

### Answer

6.588

### Explanation
The which function creates an index for virginica species, the $ operator singles out the Sepal.Length column, then the mean and round function do the rest.

round(mean(iris[which(iris$Species == "virginica"),]$Sepal.Length))
Ans: 7


Question 2
----------

Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

### Answer
Using Apply to aggregate column means

apply(iris[, 1:4], 2, mean)

## Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
##     5.843333     3.057333     3.758000     1.199333


Question 3
----------

Load the 'mtcars' dataset in R with the following code

	library(datasets)
	data(mtcars)

There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running

	?mtcars

How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?

### Answer
        tapply(mtcars$mpg, mtcars$cyl, mean)
	with(mtcars, tapply(mpg, cyl, mean))
	sapply(split(mtcars$mpg, mtcars$cyl), mean)


Question 4
----------

Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

### Answer

126.5779

### Explanation
Using the built in looping tapply function to aggregate and then round/abs.

Self-explanatory

new <- tapply(mtcars$hp, mtcars$cyl, mean)
round(abs(new[3]-new[1]))
##   8 
## 127	

Question 5
----------

If you run

	debug(ls)

what happens when you next call the 'ls' function?

### Answer

Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.
