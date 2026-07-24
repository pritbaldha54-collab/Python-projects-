# My Personal Diary

import datetime as date

class MyDiary:

    def add_entry(self):
        entry = input("\nWrite your diary entry : ")

        file = open("diary.txt", "a")
        file.write(str(date.datetime.now()))
        file.write("\n" + entry + "\n\n")
        file.close()

        print("\nour entry has been saved.....................................")


    def view_entry(self):
        try:
            file = open("diary.txt", "r")
            content = file.read()
            file.close()

            if content:
                print("\nAll Diary Entries")
                print("=" * 30)
                print(content)
            else:
                print("\nDiary is empty.")

        except FileNotFoundError:
            print("\nno diary entries available.................................")


    def find_entry(self):
        search_word = input("\nEnter word to find : ")

        try:
            file = open("diary.txt", "r")
            lines = file.readlines()
            file.close()

            match_found = False

            for line in lines:
                if search_word.lower() in line.lower():
                    print("\n", line)
                    match_found = True

            if match_found == False:
                print("\nEntry not found....................................")

        except FileNotFoundError:
            print("\ndiary file not found......................................")


    def delete_entries(self):
        confirm = input("\nDo you want to delete all entries? (yes/no) : ")

        if confirm.lower() == "yes":
            try:
                file = open("diary.txt", "r")
                content = file.read()
                file.close()

                if content:
                    file = open("diary.txt", "w")
                    file.close()
                    print("\nall diary entries deleted..............")
                else:
                    print("\nDiary is already empty....................")

            except FileNotFoundError:
                print("\ndiary file does not exist.....................")

        else:
            print("\nDelete operation cancelled........................")


diary = MyDiary()

print("-"*20)
print("Welcome to My Personal Diary")
print("-"*20)

while True:

    print("\n--- 📖 Personal Diary Menu 📖 ---")
    print("1. Write New Entry")
    print("2. Show All Entries")
    print("3. Find Entry")
    print("4. Remove All Entries")
    print("5. Exit")

    choice = int(input("\nEnter your choice : "))

    match choice:
        case 1:
            diary.add_entry()

        case 2:
            diary.view_entry()

        case 3:
            diary.find_entry()

        case 4:
            diary.delete_entries()

        case 5:
            print("\nThank you for using Personal Diary!!!!!!!!!!!!!!!!!!! 😊")
            break

        case _:
            print("\nInvalid choice! Enter a number from 1 to 5.")