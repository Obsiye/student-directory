@students = [] 

def print_header
 puts "The students of Villians Academy"
 puts "-------------"
end
def print_students_list
    car = name_begins_with

    if @students.count > 0
      @students.group_by {|x| x[:cohort]}.map do |y|
        puts "#{y[0]} cohort ---"

          y[1].each do |z| 

            if car == z[:name][0].upcase
              puts z[:name]
            end
          end
      end
    end

end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def name_begins_with
  
 puts "Print only names begining with character...\nPlease enter a character between A-Z"

 character =STDIN.gets.chop.upcase
 character
end

def input_students

  puts "Please enter the names of the students and their cohorts"
  puts "To finish, just hit return twice"

  name = STDIN.gets.chop

  puts "Please enter the Student's cohort"
  cohort = STDIN.gets.chop.to_sym
  if cohort.empty? then cohort = 'January' end

  while !name.empty?

    append_students(name,cohort)
    puts "Now we have #{@students.count} " + if @students.count < 2 then "student" else "students" end
    
    name = STDIN.gets.chop
    cohort = STDIN.gets.chop.to_sym
  end

end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
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
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students

  file = File.open("students.csv","w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    append_students(name,cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def append_students(name,cohort)
  @students << {name: name.capitalize, cohort: cohort.to_sym.capitalize}
end

try_load_students
interactive_menu
