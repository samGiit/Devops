import sys

num1 = input(" enter a  number: ")
try:
    num1 = int(num1)
except:
    print("make sure you enter a number", file=sys.stderr)
    sys.exit()

if 1 <= num1 <= 10:
    print(num1, "votre nombre est compris entre 1 et 10")
else:
    print(num1," n'est pas compris entre 1 et 10")