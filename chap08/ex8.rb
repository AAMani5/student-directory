# make a list of existing cohorts in students array
# display students grouped by cohorts
# note: default cohort is november & if cohort entered has error, a random one will be assigned

def input_students
  puts "Please enter the names of the student"
  # get the first name
  name = gets.chomp
  puts "Please enter the cohort of the student"
  #get the cohort
  cohort = gets.chomp
  #create an empty array
  students = []
  puts "To finish, just hit return when the student's name is asked"
  # while the name is not empty, repeat this code
  while !name.empty? do
    cohort =  cohort_check(cohort) # november will be assigned if nothing entered
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter the next student's name"
    name = gets.chomp
    break if name.empty?
    puts "Please enter the student's cohort"
    cohort = gets.chomp
  end
  #return the array of students
  students
end

def cohort_check(cohort_name)
  cohort_name = cohort_name.empty? ? "november" : cohort_name.downcase
  # check that cohort_name is one of the 12 months
  possible_name = %w(january feburary march april may june july august september october november december)
  if possible_name.include? cohort_name
    return cohort_name
  else
    return possible_name[rand(12)] # else send a random month
  end
end

def existing_cohort(students) # list of unique cohort in students array
  all_existing_cohorts = students.map do |student|
    student[:cohort]
  end.uniq
end

def print_header
  puts "The students of Villains Academy"
  puts "_" * 14
end

def print(students) # print students grouped by cohorts
  all_existing_cohorts = existing_cohort(students)
  all_existing_cohorts.each do |each_cohort|
    puts "Students in #{each_cohort} cohort are:"
    students.each do |student|
      puts "#{student[:name]}" if student[:cohort] == each_cohort
    end
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
