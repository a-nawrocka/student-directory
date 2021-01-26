@students = []

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_student_list()
  @students.each_with_index do |student, index|
    puts ("#{index +1}. #{student[:name]} (#{student[:cohort]} cohort) and born in #{student[:birth]}")
  end
end 

def print_footer()
  if @students.count == 1
    puts "Now we have 1 student"
  else 
    puts "Overall, we have #{@students.count} great students"
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.strip
  # while the name is not empty, repeat this code
  until name.empty? do
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have 1 student"
    else 
      puts "Now we have #{@students.count} students"
    end

    puts "Where this person was born"
    place_of_birth = gets.strip
    @students[-1][:birth] = place_of_birth
    
    puts "To which cohort add this person?"
    cohort = gets.strip
    if !cohort.empty?
      @students[-1][:cohort] = cohort.downcase.to_sym
    end
    
    name = gets.strip
  end
end

def print_by_cohort()
  students_by_cohort = {}
  @students.each do |student|
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

def print_menu()
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def show_students()
  print_header()
  print_student_list()
  print_footer()
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu()
  loop do
  print_menu()
  process(gets.chomp)
  end
end

interactive_menu()