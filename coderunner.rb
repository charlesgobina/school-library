require "./person.rb"
require "./book.rb"
require "./rental.rb"

person_one = Person.new(22, "Jake")
person_two = Person.new(19, "Owen")

book_one = Book.new("5 am club", "Charles Gobina")
book_two = Book.new("4hr Work Week", "Tim Ferris")

rental_one = Rental.new(book_one, person_one)
rental_two = Rental.new(book_two, person_two)
rental_three = Rental.new(book_two, person_two)
rental_four = Rental.new(book_two, person_two)

book_one.rental.count
book_two.rental.count

person_one.rental.count
person_two.rental.count

book_two.rental.map { |bk| bk.book.title }
person_two.rental.map { |bk| bk.person.name }

