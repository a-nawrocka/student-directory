def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  students.each_with_index do |student, index|
    puts ("#{index +1}. #{student[:name]} (#{student[:cohort]} cohort) and born in #{student[:birth]}").center(50) 
  end
end 

def print_footer(students)
  if students.count == 1
    puts "Now we have 1 student"
  else 
    puts "Overall, we have #{students.count} great students"
  end
end

# print_header
# print(students)
#print_footer(students)
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty? do
    students << {name: name, cohort: :november}
    if students.count == 1
      puts "Now we have 1 student"
    else 
      puts "Now we have #{students.count} students"
    end

    puts "Where this person was born"
    place_of_birth = gets.chomp
    students[-1][:birth] = place_of_birth
    
    puts "To which cohort add this person?"
    cohort = gets.chomp
    if !cohort.empty?
      students[-1][:cohort] = cohort.downcase.to_sym
    end
    
    name = gets.chomp
  end
  
  students 
end

def print_by_cohort(students)
  students_by_cohort = {}
  students.each do |student|
    cohort_key = student[:cohort]
    
    if !students_by_cohort.has_key?(cohort_key)
      students_by_cohort[cohort_key] = []
    end
    students_by_cohort[cohort_key].push(student[:name])
  end
  
  students_by_cohort.each do |cohort, names|
    puts cohort.upcase 
    names.each do |name|
      puts name
    end
  end
end

students = input_students
print_header
print(students)
print_footer(students)

print_by_cohort(students)

