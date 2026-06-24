print("Welcome to Pattern generator and Number analyzer!")

while True:
    print("1. Pattern generate")
    print("2. Number analysis")
    print("3. Exit")

    choice = int(input("enter your choice  : "))

    match choice:
        case 1:
            n = int(input("enter the number of rows : "))
            for i in range(1,n+1):
                        for _ in range(n-i):
                            print(" ", end= " ")
                        for j in range(1,i+1):
                            print("*", end= " ")
                        print()

        case 2:
            start = int(input("enter start number : "))
            end = int(input("enter end number : "))

            count = 0

            for i in range(start,end+1):
                if i % 2 == 0:
                    print(f"{i} is Even Number.")
                else:
                    print(f"{i} is Odd Number.")
                
                count += i
            
            print("Sum of all numbers : ", count)

        case 3:
            print("Thank You, Visit Again.")
            break

        case _:
            print("Invalid choice. Please try again.")   
