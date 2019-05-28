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
