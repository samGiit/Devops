import sys
import random

genrateNumber = random.randint(0,99)
count = 0
while True :
    num1 = input("Guess the randmoly given number between 0-00:")

    try:
        num1 = int(num1)
    except:
        print("make sure you enter a number", file=sys.stderr)
        count = count + 1
    else:
        if num1 < genrateNumber:
            print(" you've enter a lower number. Guess again")
            count = count + 1
        elif num1 > genrateNumber:
            print(" you've enter a greater number. Guess again")
            count = count + 1   
        else:
            print(" Congratulations!! you found the right number")
            count = count + 1
            print(" you'me made ", count, "attempt")
            print("the random number was ", genrateNumber)
            break
    
        