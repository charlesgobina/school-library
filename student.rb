require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, classroom, _parent_permision)
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def stud_classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
