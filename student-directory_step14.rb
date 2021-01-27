@students = []

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_student_list()
  @students.each_with_index do |student, index|
    puts ("#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)")
  end
end 

def print_footer()
  if @students.count == 1
    puts "Now we have 1 student"
  else 
    puts "Overall, we have #{@students.count} great students"
  end
end

def add_students(name, cohort) 
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.strip
  # while the name is not empty, repeat this code
  until name.empty? do
    add_students(name, :november)
    if @students.count == 1
      puts "Now we have 1 student"
    else 
      puts "Now we have #{@students.count} students"
    end

    puts "To which cohort add this person?"
    cohort = STDIN.gets.strip
    if !cohort.empty?
      @students[-1][:cohort] = cohort.downcase.to_sym
    end
    puts "Student was added"
    name = STDIN.gets.strip
  end
end

def print_menu()
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
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
      input_students()
    when "2"
      show_students()
    when "3"
      filename = get_save_filename()
      filename == "" ? save_students() : save_students(filename)
    when "4"
      filename = get_load_filename()
      filename == "" ? load_students() : load_students(filename)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def get_save_filename()
  puts "Where would you like to save students?"
  STDIN.gets.chomp
end

def get_load_filename() 
  puts "Which file would you like to load?"
  STDIN.gets.chomp
end

def save_students(filename = "students.csv")
  file = File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      cvs_line = student_data.join(",")
      file.puts cvs_line
    end
    
    puts "List saved to #{file.path}"
  end
end

def load_students(filename = "students.csv")
  @students = []
  
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_students(name, cohort.to_sym)
    end
  end
  
  puts "Loaded #{@students.count} from #{filename}"
end

def interactive_menu()
  loop do
  print_menu()
  process(STDIN.gets.chomp)
  end
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  if filename.nil?
    load_students()
  else
    if File.exists?(filename) # if it exists
      load_students(filename)
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
  end
end

try_load_students()
interactive_menu()

