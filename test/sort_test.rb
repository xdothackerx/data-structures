require "minitest/spec"
require "minitest/autorun"
require "benchmark"
require "./lib/sort"
require "pry"
require "pry-nav"

def gen_nums(type)
  if type == "random"
    (-10000..10000).to_a.shuffle
  elsif type == "nearly-ordered"
    nums = (-10000..10000).to_a
    move = nums[0]
    nums[0] = nums[1]
    nums[1] = move
    nums
  elsif type =="reverse"
    (-10000..10000).to_a.reverse
  elsif type == "few unique"
    nums = []
    1.times {nums += (-10000..10000).to_a}
    nums
  elsif type == "challenge"
    f = File.open("./lib/input.txt")
    array = Array.new
    f.each_line { |line| array << line.to_i }
    array
  else
    raise "Invalid argument: choose 'random', 'nearly-ordered', 'reverse', or 'few unique'."
  end
end

# describe "Insertion Sort" do
#   it "Sorts an array of random numbers from least to greatest." do
#     gen_nums("random").ins_sort.must_equal (1..10000).to_a
#   end
#   it "Sorts an array of nearly sorted numbers" do
#     gen_nums("nearly-ordered").ins_sort.must_equal (1..10000).to_a
#   end
#   it "Sorts an array of reversed sorted numbers" do
#     gen_nums("reverse").ins_sort.must_equal (1..10000).to_a
#   end
#   it "Sorts an array of numbers with few unique values" do
#     gen_nums("few unique").ins_sort.must_equal gen_nums("few unique").sort
#   end
# end

# describe "Merge Sort" do
#   it "Sorts an array of random numbers from least to greatest." do
#     gen_nums("random").merge_sort.must_equal (1..100000).to_a
#   end
#   it "Sorts an array of nearly sorted numbers" do
#     gen_nums("nearly-ordered").merge_sort.must_equal (1..100000).to_a
#   end
#   it "Sorts an array of reversed sorted numbers" do
#     gen_nums("reverse").merge_sort.must_equal (1..100000).to_a
#   end
#   it "Sorts an array of numbers with few unique values" do
#     gen_nums("few unique").merge_sort.must_equal gen_nums("few unique").sort
#   end
# end

# describe "Quick Sort" do
#   it "Sorts an array of random numbers from least to greatest." do
#     gen_nums("random").quick_sort.must_equal (1..10000).to_a
#   end
#   it "Sorts an array of nearly sorted numbers" do
#     gen_nums("nearly-ordered").quick_sort.must_equal (1..10000).to_a
#   end
#   it "Sorts an array of reversed sorted numbers" do
#     gen_nums("reverse").quick_sort.must_equal (1..10000).to_a
#   end
#   it "Sorts an array of numbers with few unique values" do
#     gen_nums("few unique").quick_sort.must_equal gen_nums("few unique").sort
#   end
# end

describe "Radix Sort" do
  it "Sorts an array of random numbers from least to greatest." do
    gen_nums("random").radix_sort.must_equal (-10000..10000).to_a
  end
  it "Sorts an array of nearly sorted numbers" do
    gen_nums("nearly-ordered").radix_sort.must_equal (-10000..10000).to_a
  end
  it "Sorts an array of reversed sorted numbers" do
    gen_nums("reverse").radix_sort.must_equal (-10000..10000).to_a
  end
  it "Sorts an array of numbers with few unique values" do
    gen_nums("few unique").radix_sort.must_equal gen_nums("few unique").sort
  end
end

Minitest.after_run {
  puts "\n Insertion Sort:"
  puts "Nearly-Ordered: #{Benchmark.measure{gen_nums("nearly-ordered").ins_sort}}"
  puts "Few Unique: #{Benchmark.measure{gen_nums("few unique").ins_sort}}"
  puts "Random Order: #{Benchmark.measure{gen_nums("random").ins_sort}}"
  puts "Reverse Order: #{Benchmark.measure{gen_nums("reverse").ins_sort}}"
  # puts "Challenge: #{Benchmark.measure{gen_nums("challenge").ins_sort}}"
  puts "\n Merge Sort:"
  puts "Nearly-Ordered: #{Benchmark.measure{gen_nums("nearly-ordered").merge_sort}}"
  puts "Few Unique: #{Benchmark.measure{gen_nums("few unique").merge_sort}}"
  puts "Random Order: #{Benchmark.measure{gen_nums("random").merge_sort}}"
  puts "Reverse Order: #{Benchmark.measure{gen_nums("reverse").merge_sort}}"
  puts "Challenge: #{Benchmark.measure{gen_nums("challenge").ins_sort}}"
  puts "\n Quick Sort:"
  puts "Nearly-Ordered: #{Benchmark.measure{gen_nums("nearly-ordered").quick_sort}}"
  puts "Few Unique: #{Benchmark.measure{gen_nums("few unique").quick_sort}}"
  puts "Random Order: #{Benchmark.measure{gen_nums("random").quick_sort}}"
  puts "Reverse Order: #{Benchmark.measure{gen_nums("reverse").quick_sort}}"
  puts "Challenge: #{Benchmark.measure{gen_nums("challenge").ins_sort}}"
  puts "\n Radix Sort:"
  puts "Nearly-Ordered: #{Benchmark.measure{gen_nums("nearly-ordered").radix_sort}}"
  puts "Few Unique: #{Benchmark.measure{gen_nums("few unique").radix_sort}}"
  puts "Random Order: #{Benchmark.measure{gen_nums("random").radix_sort}}"
  puts "Reverse Order: #{Benchmark.measure{gen_nums("reverse").radix_sort}}"
  puts "Challenge: #{Benchmark.measure{gen_nums("challenge").ins_sort}}"
}
