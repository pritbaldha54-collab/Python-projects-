def create_file():
    file_name = input("\nEnter file name : ")

    file = open(file_name,"w")
    file.close()

    print("\n✅ File created successfully!")


def write_file():
    file_name = input("\nEnter file name : ")
    data = input("\nEnter data to write : ")

    file = open(file_name,"w")
    file.write(data)
    file.close()

    print("\n✅ Data written successfully!")


def read_file():
    file_name = input("\nEnter file name : ")

    try:
        file = open(file_name,"r")
        print("\nFile content : ")
        print(file.read())
        file.close()

        print("\n✅ File read successfully!")

    except FileNotFoundError:
        print("\n❌ File not found")


def append_file():
    file_name = input("\nEnter file name: ")
    data = input("\nEnter data to append: ")

    file = open(file_name, "a")
    file.write(data)
    file.close()

    print("\n✅ Data appended successfully!")


