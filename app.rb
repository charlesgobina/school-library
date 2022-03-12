require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

class App # rubocop:disable Metrics/ClassLength
  def run
    @person = []
    @books = []
    @rentals = []
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

  # rubocop:disable Metrics/CyclomaticComplexity
  def compute_choice(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      leave
    else
      puts 'Please enter the options listed in the menu'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def leave
    puts 'Thank you for using this app'
    exit
  end

  def list_rentals
    if @rentals.length.zero?
      puts 'You need to create a rental to proceed. You can do that from the menu'
    else
      print 'ID of person: '
      person_id = gets.chomp.to_i
      puts
      @rentals.each do |rent|
        if rent.person.id == person_id
          puts 'Rentals:'
          puts "Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}"
        else
          puts 'Invalid ID, try again'
          puts
        end
      end
    end
    puts
  end

  def create_rental
    if @books.length.zero? || @person.length.zero?
      puts 'You need to create atleast a book and a person to proceed. You can do that from the menu'
    else
      puts 'Select a book from the following list by number'
      list_books
      print 'Enter choice: '
      choice_book = gets.chomp.to_i
      puts 'Select a person from the following list by number(not id)'
      list_people
      puts
      print 'Enter choice: '
      choice_person = gets.chomp.to_i
      print 'Enter date [YYYY/MM/DD]: '
      choice_date = gets.chomp
      @rentals.push(Rental.new(@books[choice_book], @person[choice_person], choice_date))
      puts 'Rental created successfully'
    end
    puts
  end

  def list_people
    if @person.length.zero?
      puts 'Nobody added yet!'
    else
      @person.each_with_index do |pers, index|
        if pers.is_a?(Student)
          puts "#{index}) [Student] Name: #{pers.name}, ID: #{pers.id}, Age: #{pers.age}"
        else
          puts "#{index}) [Teacher] Name: #{pers.name}, ID: #{pers.id}, Age: #{pers.age}"
        end
      end
    end
    puts
  end

  def list_books
    if @books.length.zero?
      puts 'No books added yet!'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
    puts
  end

  def create_book
    print 'Enter book title: '
    book_title = gets.chomp
    print 'Enter book author: '
    book_author = gets.chomp
    @books.push(Book.new(book_title, book_author))
    puts 'Book created successfully'
    puts
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    case choice
    when 1
      @person.push(create_student)
      puts 'Student created successfully'
      puts
    when 2
      @person.push(create_teacher)
      puts 'Teacher created successfully'
      puts
    else
      puts 'Please enter either [1] or [2]'
      create_person
    end
  end

  def create_student
    print 'Enter student name: '
    student_name = gets.chomp
    print 'Enter student age: '
    student_age = gets.chomp
    print 'Enter student classroom: '
    student_class = gets.chomp
    print 'Is student permitted by parent? [Y] for yes [N] for no: '
    permitted = gets.chomp
    case permitted
    when 'y'
      Student.new(student_age, student_name, student_class, parent_permission: true)
    when 'n'
      Student.new(student_age, student_name, student_class, parent_permission: false)
    else
      puts 'Please enter either [Y] or [N] try filling again'
      create_student
    end
  end

  def create_teacher
    print 'Enter teacher name: '
    teacher_name = gets.chomp
    puts
    print 'Enter teacher age: '
    teacher_age = gets.chomp.to_i
    puts
    print 'Enter techer specialization: '
    teacher_spec = gets.chomp
    puts
    Teacher.new(teacher_age, teacher_spec, teacher_name)
  end
end
