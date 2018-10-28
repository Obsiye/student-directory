def print_header
 puts "The students of Villians Academy"
 puts "-------------"
end
def print(students)
    car = name_begins_with


      students.group_by {|x| x[:cohort]}.map do |y|
        puts "#{y[0]} cohort ---"

          y[1].each do |z| 
            
            if car == z[:name][0].upcase
              puts z[:name]
            end
          end
      end

end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def name_begins_with
  
 puts "Print only names begining with character...\nPlease enter a character between A-Z"

 character = gets.chomp.upcase
 character
end

def input_students

  puts "Please enter the names of the students and their cohorts"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  puts "Please enter the Student's cohort"
  cohort = gets.chomp.to_sym
  if cohort.empty? then cohort = 'January' end

  while !name.empty?

    students << {name: name.capitalize, cohort: cohort.capitalize, hobbie: "Tennis" , birth_country: :Britain}
    puts "Now we have #{students.count} " + if students.count < 2 then "student" else "students" end
    
    name = gets.chomp
    cohort = gets.chomp.to_sym
  end
  
  students
end

students = input_students
print_header
print(students)
print_footer(students)
