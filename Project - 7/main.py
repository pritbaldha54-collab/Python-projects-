# Multi-Utility Toolkit

import datetime as dt
import time
import math
import random
import uuid
from utilities import file_operations as fo

print("="*40)
print("    Welcome to Multi-Utility Toolkit")
print("="*40)

while True:
    print("\n+------------------------------------------------+")
    print("|                  MAIN MENU                     |")
    print("+------------------------------------------------+")
    print("|  1. Datetime and Time Operations               |")
    print("|  2. Mathematical Operations                    |")
    print("|  3. Random Data Generation                     |")
    print("|  4. Generate Unique Identifiers (UUID)         |")
    print("|  5. File Operations (Custom Module)            |")
    print("|  6. Explore Module Attributes (dir())          |")
    print("|  7. Exit                                       |")
    print("+------------------------------------------------+")

    choice = int(input("\nEnter your choice : "))


# ================= DATETIME =================
    if choice == 1:
        while True:
            print()
            print("*"*40)
            print("     Datetime and Time Operations")
            print("*"*40)
            print("    1. Display current date & time")
            print("    2. Calculate difference between two dates/times")
            print("    3. Format date into custom format")
            print("    4. Stopwatch")
            print("    5. Countdown Timer")
            print("    6. Back to main menu")
            print("-"*40)

            ch = int(input("\nEnter choice : "))

            match ch:
                case 1:
                    print("\nCurrent Date & Time : ",dt.datetime.now())
                case 2:
                    d1 = input("\nEnter the first date (YYYY-MM-DD) : ")
                    d2 = input("Enter the second date (YYYY-MM-DD) : ")

                    date1 = dt.datetime.strptime(d1,"%Y-%m-%d")
                    date2 = dt.datetime.strptime(d2,"%Y-%m-%d")
                    print("\nDifference :",(date2-date1).days)

                case 3:
                    date = input("\nEnter the date (YYYY-MM-DD) : ")
                    d = dt.datetime.strptime(date,"%Y-%m-%d")

                    print("\nFormatted date : ",d.strftime("%d/%m/%Y"))
                
                case 4:
                    s = input("\nPress Enter to start stopwatch: ")
                    start = time.time()

                    e = input("Stopwatch running... Press Enter to stop: ")
                    end = time.time()

                    total = end - start

                    print(f"\nTotal time : {round(total,2)} seconds")

                case 5:
                    sec = int(input("\nEnter second : "))
                    while sec > 0:
                        print(sec)
                        time.sleep(1)
                        sec -= 1
                    print("Time's up!")
                
                case 6:
                    break
                case _:
                    print("\n❌ Invalid choice!")



# ================= MATHEMATICS =================
    elif choice == 2:
        while True:
            print()
            print("*"*40)
            print("        Mathematical Operationss")
            print("*"*40)
            print("    1. Calculate Factorial")
            print("    2. Solve compound Interest")
            print("    3. Trigonometric Calculations")
            print("    4. Area of Gemometric Shapes")
            print("    5. Back to main menu")
            print("-"*40)

            ch = int(input("\nEnter choice : "))

            match ch:
                case 1:
                    a = int(input("\nEnter a number : "))
                    print(f"\nFactorial of {a} is {math.factorial(a)}")
                
                case 2:
                    amount = int(input("\nEnter principal amount : "))
                    rate = int(input("Enter rate of interest (%) : "))
                    year = int(input("Enter time (in year) : "))

                    total = amount * (1 + rate/100) ** year

                    print("\nCompound Interest : ",round(total,2))

                case 3:
                    angle = float(input("\nEnter angle in degrees: "))
                    print("\n1. Sin")
                    print("2. Cos")
                    print("3. Tan")

                    ch = int(input("\nEnter your choice: "))

                    radian = math.radians(angle)
                    
                    if ch == 1:
                        print("\nSin =", math.sin(radian))
                    elif ch == 2:
                        print("\nCos =", math.cos(radian))
                    elif ch == 3:
                        print("\nTan =", math.tan(radian))
                    else:
                        print("\n❌ Invalid choice")

                case 4:
                    print("\nArea of Geometric Shapes")
                    print("1. Circle")
                    print("2. Rectangle")
                    print("3. Square")
                    
                    ch = int(input("\nEnter your choice : "))
                    
                    if ch == 1:
                        r = float(input("\nEnter radius : "))
                        area = 3.14 * r * r
                        print("\nArea = ", area)
                        
                    elif ch == 2:
                        length = float(input("\nEnter length : "))
                        width = float(input("\nEnter width : "))
                        area = length * width
                        print("\nArea = ", area)
                        
                    elif ch == 3:
                        side = float(input("\nEnter side : "))
                        area = side * side
                        print("\nArea = ", area)
                        
                    else:
                        print("\n❌ Invalid choice")
                
                case 5:
                    break

                case _:
                    print("\n❌ Invalid choice!")



# ================= RANDOM =================
    elif choice == 3:
            while True:
                print()
                print("*"*35)
                print("     Random Data Generation")
                print("*"*35)
                print("    1. Generate Random Number")
                print("    2. Generate Random List")
                print("    3. Create Random Password")
                print("    4. Generate Random OTP")
                print("    5. Back to main menu")
                print("-"*35)

                ch = int(input("\nEnter choice : "))

                match ch:
                    case 1:
                        start = int(input("\nEnter starting number: "))
                        end = int(input("Enter ending number: "))

                        num = random.randint(start, end)
                        print("\nRandom Number : ",num)

                    case 2:
                        l = []

                        for i in range(5):
                            num = random.randint(1,100)
                            l.append(num)
                        print("\nRandom List = ",l)

                    case 3:
                        ch = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890"
                        len = int(input("\nEnter password length : "))
                        password = ""

                        for i in range(len):
                            password += random.choice(ch)
                        print("\nPassword :",password)
                    
                    case 4:
                        otp = random.randint(100000,999999)
                        print("\nOTP = ",otp)

                    case 5:
                        break
                    
                    case _:
                        print("\n❌ Invalid choice")



# ================= UUID =================
    elif choice == 4:
            print("\nGenerate Unique Identifiers : ")
            print("UUID :",uuid.uuid4())



# ================= FILE OPERATIONS =================
    elif choice == 5:
            while True:
                print()
                print("*"*30)
                print("       File Operations")
                print("*"*30)
                print("    1. Create a new file")
                print("    2. Write to a file")
                print("    3. Read from a file")
                print("    4. Append to a file")
                print("    5. Back to main menu")
                print("-"*30)

                ch = int(input("\nEnter choice : "))

                match ch:
                    case 1:
                        fo.create_file()
                    
                    case 2:
                        fo.write_file()
                    
                    case 3:
                        fo.read_file()        

                    case 4:
                        fo.append_file()

                    case 5:
                        break

                    case _:
                        print("\n❌ Invalid choice")



# ================= DIR =================
    elif choice == 6:
        print("\nAvailable Modules:")
        print("math | datetime | random | uuid | file_op")

        ch = input("\nEnter module name : ").lower()

        if ch == "math":
            print("\n",dir(math))
        elif ch == "datetime":
            print("\n",dir(dt))
        elif ch == "random":
            print("\n",dir(random))
        elif ch == "uuid":
            print("\n",dir(uuid))
        elif ch == "file_op":
            print("\n",dir(fo))
        else:
            print("\n❌ Module not found")           



# ================= EXIT =================
    elif choice == 7:
        print("\n😊 Thank You for Using Multi-Utility Toolkit")
        break

    else:
        print("\n❌ Invalid choice! Please choose from 1 to 7.")