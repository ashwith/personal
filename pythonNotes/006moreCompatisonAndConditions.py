# Python supports several logical operators. We've already looked at the
# greater than operator. Here are the rest:

a = 23
b = 42
c = 12
d = 42

is_greater = a > b
is_lesser = b < c
is_greater_than_or_equal = a >= 23
is_less_than_or_equal = b <= 12

is_equal_to = a == b
is_not_equal_to = c != 12

# The == operator compares to check if the two numbers are the same. The two
# equal signs are important. The single equal sign is a different operator
# because it assigns to variables. The result of all the expressions above is
# either 'True' or 'False'

# You can also compare strings:
name1 = "Johanna"
name2 = "Joanna"
is_name_same = name1 == name2

# We can now look at more if expressions. First is the if-else. The if-else
# lets you add a statement to execute if the condition in the if statement is
# false:
if age > 18:
    eligible_voters += 1
else:
    ineligible_voters += 1

# Notice again the use of indentation - it is central to python. You also
# notice a new operator: +=. a += b is the same as writing a = a + b

# Now suppose you wanted to check multiple conditions. For example, let's say
# you're writing a billing program for a restaurant and you need to create a
# bill. This requires you to check the price of the dish and add the correct
# number to the total. The following snippet shows how this could be done. One
# aside before that - there are much simpler ways to actually do this in python
# but this is shown as an example:

# Assuming that the name of the dish is in the variable called "item"
if item == 'chilly chicken':
    total += 60
elif item == 'chicken fried rice':
    total += 40
elif item == 'veg friend rice':
    total += 30
elif item == 'baby corn chilly':
    total += 50
else:
    # This isn't the best way to work with errors in python. We'll see better
    # ways much later
    print("ERROR: Item not in menu!")

# There is a one line form of the if-else statement that's useful when the
# statements involved are concise. Suppose we want to store the greater of two
# numbers, we could just write it as follows:

greater_num = num1 if num1 > num2 else num2

# Finally, we may want to combine conditions in an if statement. What if we're
# counting teenagers? We'd be interested in ages 13 to 18. To do that we use
# the 'and' operator:
if age >= 13 and age <= 18:
    num_teens += 1

# We could be interested in counting people who know python or C for a job. In
# that case we use the 'or' operator:
if known_lang = 'c' or known_lang = 'python':
    num_eligible += 1

# We may also have a case where we need to check the negation of a statement.
# In this case use the 'not' operator:
if not('a' in word or 'z' in word):
    #do something

# The above example also introduces the 'in' operator which lets you check if a
# string is part of another string. So the condition 'ash' in 'ashwith' would
# return True.
