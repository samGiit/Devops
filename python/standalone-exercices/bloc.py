import sys

while True :
    num1 = input(" Enter a  number between 1 and 10:")
    try:
        num1 = int(num1)
    except:
        print("make sure you enter a number", file=sys.stderr)
        sys.exit()
    else:
        if 1<= num1 <= 10:
            break

print("your number", num1, "is between 1 and 10")