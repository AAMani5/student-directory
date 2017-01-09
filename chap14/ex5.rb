# prompts user to enter a filename, if it does not exist -> msg & display menu

@students = [] # an empty array accessible to all methods
def input_students
  puts "You chose the option to input student names"
  puts "Please enter the names of the students"
  puts "To finih, just hit return twice"
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
     add_student(name, :november) # @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
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
  puts "You chose the option to show student list"
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
    save_students(prompt_for_filename)
  when "4"
    load_students(prompt_for_filename)
  when "9"
    puts "Thanks for using cmd line app."
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  @first ||= true
  try_load_students if @first == true
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students(filename)
  if File.exists?(filename)
    puts "Saving students to #{filename} file."
    # open the file for writing
    file = File.open(filename,"a")
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close # can also use File.open () do .... end to close file
    puts "#{@students.count} student names saved to file"
  else
    file_does_not_exist
  end
end

def load_students(filename) # load from parent dir
  # @students = [] # this will reset the variable and load only from file
  if File.exists?(filename)
    puts "Loading student names from #{filename}"
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_student(name, cohort) # append the hash using shovel
    end
    file.close
    puts "Loaded #{@students.count} names from #{filename}"
  else
    file_does_not_exist
  end
end

def try_load_students
  # load students.csv by default
  filename = ARGV.first || "../students.csv" # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
    @first = "done" # only load for the first time
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def prompt_for_filename
  print "Please enter a filename:"
  print "> "
  answer = STDIN.gets.chomp
end

def file_does_not_exist
  puts "Sorry, that file does not exist."
  puts
  interactive_menu
end

interactive_menu
