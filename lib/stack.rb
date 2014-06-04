class Plate
  attr_accessor :next_plate, :id

  def initialize(id, next_plate = nil)
    @id = id
    @next_plate = next_plate
  end
end

class Dispenser
attr_accessor :top_plate

  def initialize
    @top_plate = Plate.new(0)
  end

  def push(plate)
    plate.next_plate = @top_plate
    @top_plate = plate
  end

  def pop
    top = @top_plate
    @top_plate = @top_plate.next_plate
    raise "No more plates." if @top_plate.nil?
    return top
  end
end
