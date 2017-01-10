# use a while loop to print the students list instead of each() method

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
  i = 0 # counter
  while i < students.length # condition
    puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
    i = i + 1 # update the counter
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
