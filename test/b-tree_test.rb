require "minitest/spec"
require "minitest/autorun"
require 'b-tree.rb'



describe "search" do
  before do
    @tim = Tree.new("Tim")
    @jony = Tree.new("Jony", @tim)
    @phil = Tree.new("Phil", @tim)
    @craig = Tree.new("Craig", @phil)
    @eddie = Tree.new("Eddie", @phil)
    @dan = Tree.new("Dan", @jony)
    @katie = Tree.new("Katie", @jony)
    @peter = Tree.new("Peter", @katie)
    @andrea = Tree.new("Andrea", @katie)
  end

  it "pre-order search visits each node before visiting any of its children" do
    output = capture_io { @tim.search(@tim, "pre") }
    output.must_equal ["Tim\nJony\nDan\nKatie\nPeter\nAndrea\nPhil\nCraig\nEddie\n", ""]
  end

  it "in-order search visits each node after visiting its left child, but before visiting its right child" do
    output = capture_io { @tim.search(@tim, "in") }
    output.must_equal ["Dan\nJony\nPeter\nKatie\nAndrea\nTim\nPhil\nCraig\nEddie\n", ""]
  end

  # it "post-order search visits each node after visiting both of its children" do
  #   @tim.post_order().must_equal("Dan, Peter, Andrea, Katie, Jony, Craig, Eddie, Phil, Tim")
  # end
end
