require "minitest/spec"
require "minitest/autorun"
require "stack"

describe "push(data)" do
  it "adds a data element to the stack." do
    dispenser = Dispenser.new
    plate1 = Plate.new(1)
    dispenser.push(plate1)
    dispenser.top_plate.must_equal(plate1)
  end
end

describe "pop()" do
  it "removes a data element from the stack and returns the value of that data element" do
    dispenser = Dispenser.new
    plate1 = Plate.new(1)
    plate2 = Plate.new(2)
    dispenser.push(plate1)
    dispenser.push(plate2)
    dispenser.pop().must_equal(plate2)
    dispenser.top_plate.must_equal(plate1)
  end

  it "raises an appropriate Ruby exception if the stack is empty." do
    dispenser = Dispenser.new
    dispenser.pop()
    dispenser.pop().must_raise("No more plates.")
  end
end
