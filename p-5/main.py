# Employee Management System

class Employee:
    def __init__(self,empid,name,age,salary):
        self.__empid = empid
        self.name = name
        self.age = age
        self.__salary = salary


    def dis(self):
        print("\n------ Employee Details ------")
        print("ID : ",self.__empid)
        print("Name : ",self.name)
        print("Age : ",self.age)
        print("Salary : ",self.__salary)


    def __del__(self):
        print("Object Deleted")

class Manager(Employee):
    def __init__(self,empid,name,age,salary,department):
        super().__init__(empid,name,age,salary)
        self.department = department

    def dis(self):
        super().dis()
        print("Department : ",self.department)

class Developer(Employee):
    def __init__(self,empid,name,age,salary,language):
        super().__init__(empid,name,age,salary)
        self.language = language

    def dis(self):
        super().dis()
        print("Programming Language : ",self.language)


def getdata():
    empid = int(input("\nEnter ID : "))
    name = input("Enter name : ")
    age = int(input("Enter age : "))
    salary = int(input("Enter salary : "))

    return empid,name,age,salary


employee = None
manager = None
developer = None

while True:
    print("Employee Management System")
    print("1. Create Employee")
    print("2. Create Manager")
    print("3. Create Developer")
    print("4. Show Details")
    print("5. Exit")

    choice = int(input("\nEnter your choice : "))

    if choice == 1:
        empid,name,age,salary = getdata()
        employee = Employee(empid,name,age,salary)

        print("\nEmployee Created Successfully!")

    elif choice == 2:
        empid,name,age,salary = getdata()
        department = input("Enter Department : ")

        manager = Manager(empid, name, age, salary, department)

        print("\nManager Created Successfully!")

    elif choice == 3:
        empid,name,age,salary = getdata()
        language = input("Enter Programming Language : ")

        developer = Developer(empid, name, age, salary, language)

        print("\nDeveloper Created Successfully!")

    elif choice == 4:
        print("\nShow Details")
        print("1. Employee")
        print("2. Manager")
        print("3. Developer")

        choice = int(input("Enter Choice : "))

        if choice == 1:
            if employee:
                employee.dis()
            else:
                print("Employee Not Created!")

        elif choice == 2:
            if manager:
                manager.dis()
            else:
                print("Manager Not Created!")

        elif choice == 3:
            if developer:
                developer.dis()
            else:
                print("Developer Not Created!")

        else:
            print("\nInvalid Choice! try again.....")

    elif choice == 5:
        print("\nThank You........")
        break

    else:
        print("\nInvalid Choice! try again......")