class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(stud)
    @student.push(stud)
    stud.classroom = self
  end
end
