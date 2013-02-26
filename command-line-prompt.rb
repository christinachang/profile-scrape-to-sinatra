require './profile-scrape.rb'

Student.create_table
Student.scrape_student_urls

#Command Line User Interface starts here
standard_menu = 
  "*****************************************************
   Please enter one of the following commands:
   Note x represents the first & last names of the student you are looking up
     FIND x
       to retrieve all information about a student
       Example: FIND John Smith
     ID x
       to retrieve a student's ID
       Example: ID John Smith
     EXIT
       to exit
  "

puts "Welcome to the Flatiron School Student Database.\n" + standard_menu

command = ""
while command != "EXIT"
  command = gets.strip
  student_name_inquiry = command.split.drop(1).join(" ")
  
  if command.split.shift == "FIND" 
    puts Student.find_by_name(student_name_inquiry)
  elsif command.split.shift == "ID"
    student_id = Student.find(student_name_inquiry).fetch(0)
    puts "The Student ID number is #{student_id}"
  end
  puts standard_menu
end

puts "goodbye!"