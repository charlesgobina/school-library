require './rental'

class Namable
  def correct_name
    raise NotImplementedError
  end
end

class Person < Namable
  attr_reader :id, :rental
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  private

  def of_age?
    age >= 18
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
end

class BaseDecorator < Namable
  attr_accessor :namable

  def initialize(namable)
    super()
    @namable = namable
  end

  def correct_name
    @namable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @namable.correct_name.upcase
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @namable.correct_name.slice(0, 10) unless @namable.correct_name.length <= 10
  end
end
