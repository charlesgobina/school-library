class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(book, person, date)
    @date = date
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
