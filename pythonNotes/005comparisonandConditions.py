# Most programming languages have three basic sets of instructions. They may
# have more, but the following three are most common:
#
# 1. Sequence
# 2. Selection
# 3. Iteration
#
# You've already seen "Sequence." In python, usually, one instruction follows
# the one before it. For example, the following statements will flow in
# sequence - the first statement assigns the value 4 to a variable. Then the
# second statement stores another value in a second variable. The third
# statement stores the sum of these two variables in a third variable. The
# final statement prints the answer.

a = 4
b = 3
c = a + b
print(c)

# We next look at "Selection." Selections help you execute statements
# conditionally, i.e. a statement only gets executed if some criterion in met.
# In python, this is done using an "if statement." An if statement first checks
# for a condition. If that condition is true, then the statement within the if
# statement is executed. As an example, let's say we had a variable called age
# which contained the age of a person. Let's also say we were counting the
# number of senior citizens in a larger python program. Our code will look like
# the following:
if age > 60:
    num_senior = num_senior + 1

# A caveat - the snippet above supposes that the variable age is already
# created somewhere and a value has been assigned to it. It also assumes that
# the variable num_senior has a value, otherwise the RHS of the expression
# wouldn't work - you can't use a variable in an expression before it's been
# created. We'll complete this snippet later.
#
# A few important points:
# 1. The expression 'age > 60' is called a logical expression - it compares the
# value of the variable 'age' with the value 60. If 'age' is greater than 60,
# the expression evaluates to 'True' (remember Boolean types?). Otherwise it
# evaluates to false.
# 2. The statement that has to get executed if the statement is true as spaces
# before it. These spaces aren't optional - they tell python that the statement
# is part of the 'if' block. You'll see this throughout python. It forces you
# to indent your code this way. A good side effect is that it becomes easier to
# read the code and visually see what parts are in the if statement and what
# aren't. Here's another snippet to explain further:

if age > 60:
    num_senior = num_senior + 1
    print("Seniors so far:", num_senior)
    print("Current senior's age:", age)
    total_senior_age = total_senior_age + age

#           ...
#           ...
# Some lines of code
#           ...
#           ...
average_senior_age = total_senior_age / num_senior

# In the above example, four statements get executed if the age is above 60.
# The last statement that calculates the average is not part of the if
# statement. In the snippet, there are four spaces used for indentation. How
# many spaces you use is up to you but you need to be consistent or else python
# won't understand what's part of the 'if' and what isn't. The python style
# guide recommends using 4 spaces for an indent.
