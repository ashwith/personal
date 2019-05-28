# This is a comment. Comments start with the # symbol. Anything
# written following the # symbol in the current line is a comment.

# A comment isn't code - it isn't "run" by the computer.
# Comments help the programmer understand what the code does.
# When writing a comment, explain things at a conceptual level.
# For example, for the code below, the comment above isn't useful:

# Assign 0 to i
i = 0

# All the comment says is that the value 0 assigned to i - this is obvious
# anyway - the comment doesn't really explain anything else. The following 
# is a better comment. Let's say the variable "i" is pointing to the position
# of the runner on a track

# Set runner position to zero.
i = 0

# It is a good practice to write comments before the code like the above
# example. The comment that follows is generally considered bad practice:

i = 0 # Set runner position to zero.

# That's all about comments. Let's look at variables and data types.
# A variable is a place (technical term: identifier) that stores values. Use
# meaningful names to name variables. For the runner example above, a better
# name would be:

# Set the runner position to zero
runner_position = 0

# As the example shows, it's good practice to use an underscore to use names
# consisting of multiple words. Another convention is to use camelCase but the
# official python guidelines prefer underscores. Variables can contain letters,
# numbers and underscores but the first character must be a letter or an
# underscore. Python is case sensitive, so the two examples below are two
# different data types.
this_is_one_example = 1
this Is_One_Example = 2

# Finally, there are some words you shouldn't use as variable names. For
# example 'int', 'str', etc are special in python. Using these as variable
# names can cause problems because doing so would over-write what they
# originally meant. Python won't throw an error but it could potentially cause
# errors if you were using the originally meaning of the name. Some words,
# however, can't be used at all. These are called reserved keywords. Examples
# are 'None', 'True' and 'False'. There are others we'll see as we learn more.
