import sys

num1 = input(" enter a first number: ")
try:
    num1 = int(num1)
except:
    print("make sure you enter a number", file=sys.stderr)
    sys.exit()
num2 = input(" enter a second number: ")
try:
    num2 = int(num2)
except:
    print("make sure you enter a number", file=sys.stderr)
    sys.exit()
if num1 ==  num2:
    print(num1,"=", num2)
elif num1 > num2:
    print(num1, "is greater than", num2)
else:
    print(num1, "is lesser than", num2)
