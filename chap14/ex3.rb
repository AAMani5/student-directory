# load students.csv by default if no cmd line argumment given. used || operator

@students = [] # an empty array accessible to all methods
def input_students
  puts "Please enter the names of the students"
  puts "To finih, just hit return twice"
  name = STDIN.gets.chomp

  while !name.empty? do # continue getting code while input is not empty
    add_student(name, :november) # add the student hash to the array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp # or $stdin.gets.chomp # get next student's name from user
  end
  # returns nothing, directly changes @students array
end

def print_header
  puts "The students of Villains Academy"
  puts "_" * 14
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
  puts # just to make output legible
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("../students.csv","w") # open the file for writing
  @students.each do |student| # iterate over the array of students to add data in cvs format
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close # can also use File.open () do .... end to close file
end

def load_students(filename = "../students.csv") # load from parent dir
  # @students = [] # this will reset the variable and load only from file
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort) # append the hash using a dedicated method 
  end
  file.close
end

def try_load_students
  filename = ARGV.first || "../students.csv" # first argument from the command line or default csv file
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end
interactive_menu
