require "minitest/spec"
require "minitest/autorun"
require "./lib/hash"

describe "Hash" do
  before do
    @hash = HashTable.new(1024)
  end

  it "should be of a fixed size" do
    @hash.hash_table.size.must_equal(1024)
  end

  it "should accept only strings as keys and raise an appropriate exception if not a string" do
    err = ->{ @hash.set(:key, "value") }.must_raise(RuntimeError)
    err.message.must_match /Key must be a String./
  end

  it "should hash the key provided with hash(key)" do
    @hash.hasher("key").must_equal(329)
  end

  it "should store the given val using the given key with set(key, val)" do
    @hash.set("key", "value")
  end

  it "should return the value stored with the given key with get(key)" do
    @hash.set("key", "value")
    @hash.get("key").must_equal("value")
  end

  it "should handle collisions by using buckets to contain values that share a hash" do
    @hash.set("hi", "hello")
    @hash.set("ih", "olleh")
    @hash.hasher("hi").must_equal(@hash.hasher("ih"))
    @hash.get("hi").must_equal("hello")
    @hash.get("ih").must_equal("olleh")
  end
end
