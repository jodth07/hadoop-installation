import array

# variables
one = 1
two = "two"

# list
li = list([one, two])
li.append(two)  # list
li.append("three")
len(li)
li.pop()
new_li = []

# dictionaries
new_dict = dict()
new_dict.update({"key": "value"})
data = new_dict["key"]


# functions
def new_func(arg_1, arg_2):
    arg = (arg_1, arg_2)
    return arg


# if statements
var = 24
if var == 22:
    print(f"var is 22, {var}")
elif var == 23:
    print(f"var is 23, {var}")
else:
    print(f"var is neither 22 nor 23, but instead, {var}")


# for loops


