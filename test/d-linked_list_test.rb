require "minitest/spec"
require "minitest/autorun"
require "./lib/d-linked_list"

describe "add(node)" do
  it "adds a node to the list" do
    list = List.new
    node1 = list.add(3)
    node2 = list.add(6)
    node3 = list.add(2)
    node1.next_node.must_be_same_as(node2)
    node2.prev_node.must_be_same_as(node1)
  end
end

describe "search(value)" do
  it "returns the node containing 'value' in the list if present, else return nil" do
    list = List.new
    node1 = list.add(3)
    node2 = list.add(6)
    node3 = list.add(2)
    list.search(3).must_be_same_as(node1)
  end
end

describe "delete(node)" do
  it "deletes the given node from the list, at any location, and return the object's value. If it isn't found, return nil" do
    list = List.new
    node1 = list.add(3)
    node2 = list.add(6)
    node3 = list.add(2)
    list.delete(node2)
    list.search(6).must_equal(nil)
    node1.next_node.must_be_same_as(node3)
    node3.prev_node.must_be_same_as(node1)
  end
end

describe "to_s()" do
  it "prints the list as a CSV string" do
    list = List.new
    node1 = list.add(3)
    node2 = list.add(6)
    node3 = list.add(2)
    list.to_s().must_equal("3, 6, 2")
  end
end

describe "deduplicate()" do
  it "removes nodes with duplicate values from the list" do
    list = List.new
    rand = 10.times.map { Random.rand(10) }
    values = []
    2.times { values << rand.flatten }
    values.flatten.each do |value|
      list.add(value)
    end
    list.to_s.must_equal(values.flatten.to_s.reverse.chomp("[").reverse.chomp("]"))
    list.deduplicate.to_s.must_equal(values.flatten.uniq.to_s.reverse.chomp("[").reverse.chomp("]"))
  end
end

describe "dedup()" do
  it "removes nodes with duplicate values from the list, using no additional data structures" do
    list = List.new
    rand = 10.times.map { Random.rand(10) }
    values = []
    2.times { values << rand.flatten }
    values.flatten.each do |value|
      list.add(value)
    end
    list.to_s.must_equal(values.flatten.to_s.reverse.chomp("[").reverse.chomp("]"))
    list.deduplicate.to_s.must_equal(values.flatten.uniq.to_s.reverse.chomp("[").reverse.chomp("]"))
  end
end
