print("Student Details")

name = input("Enter your name: ")
age = int(input("Enter your age: "))
height = float(input("Enter your height in feet: "))
fav_num = int(input("Enter your favourite number: "))

height_cm = height * 30.48

print("----- Details -----")

print("Name:", name)
print("Type:", type(name))
print("Memory Address:", id(name))

print("\nAge:", age)
print("Type:", type(age))
print("Memory Address:", id(age))

print("\nHeight:", height)
print("Type:", type(height))
print("Memory Address:", id(height))

print("\nFavourite Number:", fav_num)
print("Type:", type(fav_num))
print("Memory Address:", id(fav_num))


print("\nThank You!")
