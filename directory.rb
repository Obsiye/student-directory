def print_header
 puts "The students of Villians Academy"
 puts "-------------"
end
def print(students)
    car = name_begins_with
  n = 0

  while n < students.length
    if students[n][:name].start_with?(car) && students[n][:name].length < 12
      puts "#{n + 1}. #{students[n][:name]} (#{students[n][:cohort]} cohort). Born in #{students[n][:birth_country]}"
    end
    n += 1
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
    puts "Now we have #{students.count} students"
    
    name = gets.chomp
    cohort = gets.chomp.to_sym
  end
  
  students
end

students = input_students
print_header
print(students)
print_footer(students)
