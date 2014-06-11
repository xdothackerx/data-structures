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

  # def self.merge_sort(arr)
  #   return arr if arr.empty?
  #   arr = arr.combination(1).to_a
  #   merge = []
  #   until arr.size == 1
  #     left = arr.shift
  #     right = arr.shift
  #     while left.size > 0 or right.size > 0
  #       if left.size > 0 and right.size > 0
  #         if left.first < right.first
  #           merge << left.shift
  #         else
  #           merge << right.shift
  #         end
  #       elsif left.size > 0
  #         merge += left
  #         left = []
  #       elsif right.size > 0
  #         merge += right
  #         right = []
  #       end
  #     end
  #     arr << merge
  #     merge = []
  #   end
  #   arr.flatten
  # end

  def self.merge_sort(arr)
    return arr if arr.empty? || arr.sorted?
    arr = arr.combination(1).to_a
    merge = []
    until arr.size == 1
      left = arr.shift
      right = arr.shift
      until left.size.zero? || right.size.zero?
        if left.first < right.first
          merge << left.shift
        else
          merge << right.shift
        end
      end
      if left.size > 0
        merge += left
        left = []
      else
        merge += right
        right = []
      end
      arr << merge
      merge = []
    end
    arr.flatten
  end

  def sorted?
    each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  end

end
