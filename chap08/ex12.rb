# To print only if there is atleast one student

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
  #if students.count > 0 # doing this will print the header & footer
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  #end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
if students.count > 0
  print_header
  print(students)
  print_footer(students)
end