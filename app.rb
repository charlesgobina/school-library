require './book.rb'
require './classroom.rb'
require './person.rb'
require './rental.rb'
require './student.rb'
require './teacher.rb'
require 'pry'

class App
  def run
    @person = []
    @student = []
    puts 'Welcome to School Library App!'
    options
  end

  def options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    print '[Enter number: ] '
    choice = gets.chomp.to_i
    compute_choice(choice)
    options
  end

  def compute_choice(choice)
    case choice
    when 3
      create_person
    else
      puts "Enter specified Numbers"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Inout the number]: '
    choice = gets.chomp.to_i
    case choice
    when 1
      @person.push(create_student)
      binding.pry
      puts 'Student created successfully'
    when 2
      @person.push(create_teacher)
      puts 'Teacher created successfully'
    else
      puts 'Please enter either [1] or [2]'
      create_person
    end  
  end

  def create_student
    print 'Enter student name: '
    student_name = gets.chomp.to_i
    puts
    print 'Enter student age: '
    student_age = gets.chomp.to_i
    puts
    print 'Is student permitted by parent? [Y] for yes [N] for no: '
    permitted = gets.chomp
    puts
    case permitted
    when 'y'
      Student.new(student_age, student_name)
    when 'n'
      Student.new(student_age, student_name, parent_permission: false)
    else
      'Please enter either [Y] or [N]'
      create_student
    end
  end
end