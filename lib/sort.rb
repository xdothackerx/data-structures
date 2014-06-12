class Array

  def self.ins_sort(arr)
    (1..arr.length-1).each do |n|
      insertion_ind = n
      insertion_val = arr.delete_at(insertion_ind)
      while insertion_ind > 0 && insertion_val < arr[insertion_ind-1]
        insertion_ind -= 1
      end
      arr.insert(insertion_ind, insertion_val)
    end
    return arr
  end

  def merge_sort
    return self if self.size < 2 || self.sorted?
    arr = self.combination(1).to_a
    merge = []
    until arr.size == 1
      left, right = arr.shift, arr.shift
      until left.size.zero? || right.size.zero?
        if left.first < right.first
          merge << left.shift
        else
          merge << right.shift
        end
      end
      if left.size > 0
        merge += left.slice!(0..left.size)
      else
        merge += right.slice!(0..right.size)
      end
      arr << merge.slice!(0..merge.size)
    end
    arr.flatten
  end

  def sorted?
    each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  end

end
