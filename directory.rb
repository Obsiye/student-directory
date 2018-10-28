def print_header
 puts "The students of Villians Academy"
 puts "-------------"
end
def print(students)
    car = name_begins_with

    if students.count > 0
      students.group_by {|x| x[:cohort]}.map do |y|
        puts "#{y[0]} cohort ---"

          y[1].each do |z| 

            if car == z[:name][0].upcase
              puts z[:name]
            end
          end
      end
    end

end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def name_begins_with
  
 puts "Print only names begining with character...\nPlease enter a character between A-Z"

 character = gets.chop.upcase
 character
end

def input_students

  puts "Please enter the names of the students and their cohorts"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chop

  puts "Please enter the Student's cohort"
  cohort = gets.chop.to_sym
  if cohort.empty? then cohort = 'January' end

  while !name.empty?

    students << {name: name.capitalize, cohort: cohort.capitalize, hobbie: "Tennis" , birth_country: :Britain}
    puts "Now we have #{students.count} " + if students.count < 2 then "student" else "students" end
    
    name = gets.chop
    cohort = gets.chop.to_sym
  end
  
  students
end


def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
