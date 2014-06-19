class Person
  attr_accessor :next_person, :name

  def initialize(name, next_person = nil)
    @name = name
    @next_person = next_person
  end
end

class Line
  attr_accessor :first_in_line, :last_in_line, :length

  def initialize
    @length = 0
  end

  def enqueue(person)
    @first_in_line = person && @last_in_line = person if @first_in_line.nil?
    @last_in_line.next_person = person
    @last_in_line = person
    @length += 1
  end

  def dequeue()
    raise "Nobody is in line." if @first_in_line.nil?
    first = @first_in_line
    @first_in_line = @first_in_line.next_person
    @length -+ 1
    return first
  end

  def size()
    @length
  end
end
