require "minitest/spec"
require "minitest/autorun"
require "linked_list"

describe "insert(node)" do
  it "inserts a node into the head of the list" do
    hunt = TreasureHunt.new("A crapton of gold.")
    waypoint = hunt.add_waypoint("map")
    hunt.next_waypoint.must_be_same_as(waypoint)
  end
end

describe "size()" do
  it "returns the length of the list" do
    hunt = TreasureHunt.new("Some awesome weapons.")
    hunt.add_waypoint("map")
    hunt.add_waypoint("hint")
    hunt.add_waypoint("pointer")
    hunt.num_waypoints.must_equal(4)
  end
end

describe "search(value)" do
  it "returns the node containing 'value' in the list if present, else return nil" do
    hunt = TreasureHunt.new("Cool stuff.")
    map_loc = hunt.add_waypoint("map")
    hint_loc = hunt.add_waypoint("hint")
    key_loc = hunt.add_waypoint("key")
    hunt.search("map").must_be_same_as(map_loc)
  end
end

describe "remove(node)" do
  it "remove the given node from the list, at any location, and return the object's value. If it isn't found, return nil" do
    hunt = TreasureHunt.new("Things.")
    map_loc = hunt.add_waypoint("map")
    hint_loc = hunt.add_waypoint("hint")
    key_loc = hunt.add_waypoint("key")
    hunt.search("map").must_be_same_as(map_loc)
    hunt.remove(map_loc)
    hunt.search("map").must_equal(nil)
  end
end

describe "to_s()" do
  it "print the list as a CSV string" do
    hunt = TreasureHunt.new("Things.")
    map_loc = hunt.add_waypoint("map")
    hint_loc = hunt.add_waypoint(13)
    key_loc = hunt.add_waypoint(:key)
    hunt.to_s().must_equal(":key, 13, 'map', 'Things.'")
  end
end
