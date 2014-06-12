require "minitest/spec"
require "minitest/autorun"
require "benchmark"
require "./lib/sort"

def gen_nums(type)
  if type == "random"
    (1..10).to_a.shuffle
  elsif type == "nearly-ordered"
    nums = (1..100).to_a
    move = nums[0]
    nums[0] = nums[1]
    nums[1] = move
    return nums
  elsif type =="reverse"
    (1..100).to_a.reverse
  elsif type == "few unique"
    nums = []
    10.times {nums += (1..10).to_a}
    return nums
  else
    raise "Invalid argument: choose 'random', 'nearly-ordered', 'reverse', or 'few unique'."
  end
end

# describe "Insertion Sort" do
#   it "Sorts an array of random numbers from least to greatest." do
#     input = Array.ins_sort(gen_nums "random")
#     input.must_equal (1..100).to_a
#   end
#   it "Sorts an array of nearly sorted numbers" do
#     input = Array.ins_sort(gen_nums "nearly-ordered")
#     input.must_equal (1..100).to_a
#   end
#   it "Sorts an array of reversed sorted numbers" do
#     input = Array.ins_sort(gen_nums "reverse")
#     input.must_equal (1..100).to_a
#   end
#   it "Sorts an array of numbers with few unique values" do
#     input = Array.ins_sort(gen_nums "few unique")
#     input.must_equal gen_nums("few unique").sort
#   end
# end

# describe "Merge Sort" do
#   it "Sorts an array of random numbers from least to greatest." do
#     input = Array.merge_sort(gen_nums "random")
#     input.must_equal (1..100).to_a
#   end
#   it "Sorts an array of nearly sorted numbers" do
#     input = Array.merge_sort(gen_nums "nearly-ordered")
#     input.must_equal (1..100).to_a
#   end
#   it "Sorts an array of reversed sorted numbers" do
#     input = Array.merge_sort(gen_nums "reverse")
#     input.must_equal (1..100).to_a
#   end
#   it "Sorts an array of numbers with few unique values" do
#     input = Array.merge_sort(gen_nums "few unique")
#     input.must_equal gen_nums("few unique").sort
#   end
# end

describe "Quick Sort" do
  it "Sorts an array of random numbers from least to greatest." do
    input = Array.quick_sort(gen_nums "random")
    input.must_equal (1..10).to_a
  end
  # it "Sorts an array of nearly sorted numbers" do
  #   input = Array.quick_sort(gen_nums "nearly-ordered")
  #   input.must_equal (1..100).to_a
  # end
  # it "Sorts an array of reversed sorted numbers" do
  #   input = Array.quick_sort(gen_nums "reverse")
  #   input.must_equal (1..100).to_a
  # end
  # it "Sorts an array of numbers with few unique values" do
  #   input = Array.quick_sort(gen_nums "few unique")
  #   input.must_equal gen_nums("few unique").sort
  # end
end

Minitest.after_run {
  # puts "Insertion Sort:"
  # puts "Nearly-Ordered: #{Benchmark.measure{Array.ins_sort gen_nums("nearly-ordered")}}"
  # puts "Few Unique: #{Benchmark.measure{Array.ins_sort gen_nums("few unique")}}"
  # puts "Random Order: #{Benchmark.measure{Array.ins_sort gen_nums("random")}}"
  # puts "Reverse Order: #{Benchmark.measure{Array.ins_sort gen_nums("reverse")}}"
  # puts "\n Merge Sort:"
  # puts "Nearly-Ordered: #{Benchmark.measure{Array.merge_sort gen_nums("nearly-ordered")}}"
  # puts "Few Unique: #{Benchmark.measure{Array.merge_sort gen_nums("few unique")}}"
  # puts "Random Order: #{Benchmark.measure{Array.merge_sort gen_nums("random")}}"
  # puts "Reverse Order: #{Benchmark.measure{Array.merge_sort gen_nums("reverse")}}"
  # puts "\n Quick Sort:"
  # puts "Nearly-Ordered: #{Benchmark.measure{Array.quick_sort gen_nums("nearly-ordered")}}"
  # puts "Few Unique: #{Benchmark.measure{Array.quick_sort gen_nums("few unique")}}"
  # puts "Random Order: #{Benchmark.measure{Array.quick_sort gen_nums("random")}}"
  # puts "Reverse Order: #{Benchmark.measure{Array.quick_sort gen_nums("reverse")}}"
}
