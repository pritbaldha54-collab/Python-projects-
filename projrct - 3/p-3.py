print("STUDENT RECORD MANAGEMENT SYSTEM")
students = []

while True:
    print("\n1. Add Student")
    print("2. Display Students")
    print("3. Update Student")
    print("4. Delete Student")
    print("5. Display Subjects")
    print("6. Exit")

    choice = int(input("Enter Choice : "))

    match choice:
        case 1:
            sid = int(input("Enter Student ID : "))
            name = input("Enter Name : ")
            age = int(input("Enter Age : "))
            grade = input("Enter Grade : ")
            dob = input("Enter DOB : ")

            sub = input("Enter Subjects (comma separated) : ")
            subjects = set(sub.split(","))

            student = {
                "ID": sid,
                "Name": name,
                "Age": age,
                "Grade": grade,
                "DOB": dob,
                "Subjects": subjects
            }

            students.append(student)
            print("Student Added Successfully!")

        case 2:
            if len(students) == 0:
                print("No Student Found!")
            else:
                for s in students:
                    print("ID :", s["ID"])
                    print("Name :", s["Name"])
                    print("Age :", s["Age"])
                    print("Grade :", s["Grade"])
                    print("DOB :", s["DOB"])
                    print("Subjects :", ", ".join(s["Subjects"]))

        case 3:
            sid = int(input("Enter Student ID : "))
            found = False

            for s in students:
                if s["ID"] == sid:
                    found = True

                    print("1. Update Name")
                    print("2. Update Age")
                    print("3. Add Subject")

                    ch = int(input("Enter Choice : "))

                    match ch:
                        case 1:
                            s["Name"] = input("Enter New Name : ")
                            print("Name Updated!")

                        case 2:
                            s["Age"] = int(input("Enter New Age : "))
                            print("Age Updated!")

                        case 3:
                            new_sub = input("Enter New Subject : ")
                            s["Subjects"].add(new_sub)
                            print("Subject Added!")

                        case _:
                            print("Invalid Choice!")

            if found == False:
                print("Student Not Found!")

        case 4:
            sid = int(input("Enter Student ID : "))
            found = False

            for s in students:
                if s["ID"] == sid:
                    students.remove(s)
                    found = True
                    print("Student Deleted!")
                    break

            if found == False:
                print("Student Not Found!")

        case 5:
            all_subjects = set()

            for s in students:
                all_subjects.update(s["Subjects"])

            if len(all_subjects) == 0:
                print("No Subjects Found!")
            else:
                print("Subjects Offered:")
                for subject in all_subjects:
                    print(subject)

        case 6:
            print("Thank You!")
            break

        case _:
            print("Invalid Choice!")
