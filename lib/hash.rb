require "digest"

class HashTable
  attr_accessor :hash_table

  def initialize(size)
    @hash_table = Array.new(size) {[]}
  end

  def set(key, value)
    raise "Key must be a String." if key.is_a?(String) == false
    arr = [key, value]
    bucket_address = hasher(key)
    @hash_table[bucket_address] << arr
  end

  def get(key)
    bucket_address = hasher(key)
    bucket = @hash_table[bucket_address]
    value = nil
    bucket.each do |arr|
      value = arr[1] if arr[0] == key
    end
    value
  end

  def hasher(key)
    key.each_byte.inject(:+) % @hash_table.length
  end

end
