class Array

  def self.ins_sort(arr)
    (1..arr.length-1).each do |n|
      insertion_ind = n
      insertion_val = arr[n]
      arr.delete_at(insertion_ind)
      while insertion_ind > 0 && insertion_val < arr[insertion_ind-1]
        insertion_ind -= 1
      end
      arr.insert(insertion_ind, insertion_val)
    end
    return arr
  end

  def self.merge_sort(arr)
    arr = arr.combination(1).to_a
    merge = []
    until arr.size == 1
      left = arr.shift
      right = arr.shift
      while left.size > 0 or right.size > 0
        if left.size > 0 and right.size > 0
          if left.first < right.first
            merge << left.shift
          else
            merge << right.shift
          end
        elsif left.size > 0
          merge << left.shift
        elsif right.size > 0
          merge << right.shift
        end
      end
      arr << merge
      merge = []
    end
    arr.flatten
  end

end
