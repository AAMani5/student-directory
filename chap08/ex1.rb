# updated the program to use .to_enum.with_index(1) to start counting
# from 1 instead of default 0
# used each_with_index() to print a number before name of each student
# but each_with_index() does not take an offset e.g: if I have to start the
# index at 1

def input_students
  puts "Please enter the names of the students"
  puts "To finih, just hit return twice"
  #create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "_" * 14
end

def print(students)
  students.to_enum.with_index(1) do |student, index|
    puts "#{index}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
