require "minitest/spec"
require "minitest/autorun"
require "queue"

describe "enqueue(person)" do
  it "adds a value to the queue" do
    line = Line.new
    person = Person.new("Sam")
    line.enqueue(person)
    line.last_in_line.must_equal(person)
  end
end

describe "dequeue()" do
  it "removes the correct item from the queue and returns its value" do
    line = Line.new
    person1 = Person.new("Sam")
    line.enqueue(person1)
    person2 = Person.new("Ayen")
    line.enqueue(person2)
    person3 = Person.new("Char")
    line.enqueue(person3)
    line.dequeue().must_equal(person1)
    line.first_in_line.must_equal(person2)
  end

  it "raises an exception if the queue is empty" do
    line = Line.new
    line.dequeue().must_raise("Nobody is in line.")
  end
end

describe "size()" do
  it "returns the size of the queue" do
    line = Line.new
    person1 = Person.new("Sam")
    line.enqueue(person1)
    person2 = Person.new("Ayen")
    line.enqueue(person2)
    person3 = Person.new("Char")
    line.enqueue(person3)
    line.size().must_equal(3)
  end

  it "returns 0 if the queue is empty" do
    line = Line.new
    line.size().must_equal(0)
  end
end
