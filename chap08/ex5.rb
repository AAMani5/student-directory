# add extra info like hobby and height
# currently the program randomly select's a hobby and height from an array
def input_students
  puts "Please enter the names of the students"
  puts "To finih, just hit return twice"
  #create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  hobbies = ["dancing", "singing", "reading", "coding", "painting" ]
  heights = ["5'2\"", "6'", "6'2\"", "5'4\"", "5'7\""]
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobbies[rand(hobbies.count)], height: heights[rand(heights.count)]}
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
  students.each do |student|
    puts "#{student[:name]} (enrolled in #{student[:cohort]} cohort is #{student[:height]} tall and enjoys #{student[:hobby]})"
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
