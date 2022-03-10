class Rental
  attr_accessor :book, :person

  def initialize(book, person)
    @book = book
    @book.rental << self
    @person = person
    @person.rental << self
  end

  def stud_classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def book_rented=(book)
    @book = book
    book.rental.push(self) unless book.rental.include?(self)
  end

  def rented_by=(person)
    @person = person
    person.rental.push(self) unless person.rental.include?(self)
  end
end
