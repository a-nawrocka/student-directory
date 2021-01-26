def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort) and born in #{student[:birth]}" 
  end
end 

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
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
    puts "Now we have #{students.count} students"
    puts "Where this person was born"
    place_of_birth = gets.chomp
    students[-1][:birth] = place_of_birth
    name = gets.chomp
  end
  students 
end

students = input_students
print_header
print(students)
print_footer(students)