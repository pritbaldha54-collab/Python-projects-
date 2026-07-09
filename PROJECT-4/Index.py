# WELCOME TO THE DATA ANALYZER & TRANSFORMER PROGRAM
arr = []


def input_data():
    """This function take input from user"""
    global arr
    arr = list(map(int, input("\nenter data separated by space : ").split()))
    print("\ndata stored successfully")


def built_fun():
    """This function use built-in function"""
    if len(arr) == 0:
        print("\nNo data found")
        return

    print("\ntotal elements : ",len(arr))
    print("minimum number : ",min(arr))
    print("maximum number : ",max(arr))
    print("sum of all values : ",sum(arr))
    print("average value : ",sum(arr)/len(arr))


def factorial(n):
    """This function calculate factorial"""
    if n <= 1:
        return 1
    return n * factorial(n - 1)


def lambda_data():
    """This function uses a threshold value to filter data"""
    if len(arr) == 0:
        print("\nNo data found")
        return
    
    a = int(input("\nenter a threshold value to filter out data above this value : "))
    filtered = list(filter(lambda x: x > a,arr))

    if filtered:
        print("Filtered Data:", filtered)
    else:
        print("\nNo values found")


def sort_data():
    """This function sort the data"""
    if len(arr) == 0:
        print("\nNo data found")
        return
    
    print("\nChoose option")
    print("1. Ascending")
    print("2. Descending")

    ch = int(input("\nenter your choice : "))
    if ch == 1:
        sorted_arr = sorted(arr)
        print("\nsorted data in ascending order : ",sorted_arr)
    elif ch == 2:
        sorted_arr = sorted(arr, reverse=True)
        print("\nsorted data in descending order : ",sorted_arr)
    else:
        print("\nInvalid choice")

def stat():
    """This function calculate statistics"""
    if len(arr) == 0:
        print("\nNo data found")
        return
    
    mini = min(arr)
    maxi = max(arr)
    total = sum(arr)
    avg = sum(arr) / len(arr)

    return mini, maxi, total, avg


def unique():
    """This function display unique values"""
    if len(arr) == 0:
        print("\nNo data found")
        return
    
    print("\nunique values = ", list(set(arr)))


def display_args(*args):
    """Display *args"""
    print("Values:",*args)


def display_kwargs(**kwargs):
    """Display **kwargs"""
    print("Summary:")
    for k,v in kwargs.items():
        print(k,":",v)



print("WELCOME TO THE DATA ANALYZER & TRANSFORMER PROGRAM")


# main menu
while True:
    print("\n1. Input Data")
    print("2. Display Data Summary")
    print("3. Calculate Factorial")
    print("4. Filter Data By Threshold (Lambda)")
    print("5. Sort Data")
    print("6. Display Unique Values")
    print("7. Display Dataset Statistics")
    print("8. Display *args")
    print("9. Display **kwargs")
    print("10. Display Function Documentation")
    print("11. Exit")

    ch = int(input("\nenter your choice : "))

    match ch:
        case 1:
            input_data()
        case 2:
            built_fun()
        case 3:
            n = int(input("\nenter number : "))
            print(f"\nfactorial of {n} = {factorial(n)}")
        case 4:
            lambda_data()
        case 5:
            sort_data()
        case 6:
            unique()
        case 7:
            mini, maxi, total, avg = stat()
            print(f"\nMinimum: {mini}, Maximum: {maxi}, Total: {total}, Average: {avg}")
        case 8:
            display_args(*arr)
        case 9:
            if arr:
                display_kwargs(Total=len(arr),Minimum=min(arr),Maximum=max(arr),Average=sum(arr)/len(arr))
            else:
                print("\nNo Data")
        case 10:
            print("\nFunction Documentation:")
            print(input_data.__doc__)
            print(built_fun.__doc__)
            print(factorial.__doc__)
            print(lambda_data.__doc__)
            print(sort_data.__doc__)
            print(unique.__doc__)
            print(stat.__doc__)
            print(display_args.__doc__)
            print(display_kwargs.__doc__)
        case 11:
            print("\nThank you")
            print("Goodbye!")
            break
        case _:
            print("\nInvalid choice!")