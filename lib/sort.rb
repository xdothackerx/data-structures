class Array

  # def self.ins_sort(arr)
  #   (1..arr.length-1).each do |n|
  #     insertion_ind = n
  #     insertion_val = arr.delete_at(insertion_ind)
  #     while insertion_ind > 0 && insertion_val < arr[insertion_ind-1]
  #       insertion_ind -= 1
  #     end
  #     arr.insert(insertion_ind, insertion_val)
  #   end
  #   return arr
  # end

  # def self.merge_sort(arr)
  #   return arr if arr.empty? || arr.sorted?
  #   arr = arr.combination(1).to_a
  #   merge = []
  #   until arr.size == 1
  #     left = arr.shift
  #     right = arr.shift
  #     until left.size.zero? || right.size.zero?
  #       if left.first < right.first
  #         merge << left.shift
  #       else
  #         merge << right.shift
  #       end
  #     end
  #     if left.size > 0
  #       merge += left
  #       left = []
  #     else
  #       merge += right
  #       right = []
  #     end
  #     arr << merge
  #     merge = []
  #   end
  #   arr.flatten
  # end

  def self.quick_sort(arr)
    left = 0
    right = arr.size-1
    pivot = arr.size/2.0.round
    until left == pivot-1 || right == pivot+1
      until arr[left] > arr[pivot] || left == pivot-1
        if arr[left] < arr[pivot]
        left += 1
        end
      end
      until arr[right] < arr[pivot] || right == pivot+1
        if arr[right] > arr[pivot]
        right -= 1
        end
      end
      # puts arr[pivot]
      # puts arr[left]
      # puts arr[right]
      # puts arr.inspect
      arr[right], arr[left] = arr[left], arr[right]
    end
    until left == pivot-1
      if arr[left] > arr[right]
       arr[left], arr[right] = arr[right], arr[left]

      end
      if arr[left] > arr[pivot]
        arr[left], arr[pivot] = arr[pivot], arr[left]

      end
      left += 1
    end
    until right == pivot+1
      if arr[left] > arr[right]
       arr[left], arr[right] = arr[right], arr[left]

      end
      if arr[right] < arr[pivot]
        arr[right], arr[pivot] = arr[pivot], arr[right]
      end
      right -= 1

    end
    until right == arr.size-1
      if arr[left] > arr[right]
       arr[left], arr[right] = arr[right], arr[left]

      end
      if arr[right] < arr[pivot]
        arr[right], arr[pivot] = arr[pivot], arr[right]
        pivot += 1
        right += 1 unless right == arr.size
      else
        right += 1 unless right == arr.size
      end
    end
    if arr[left] > arr[right]
       arr[left], arr[right] = arr[right], arr[left]

    end
    puts arr[pivot]
    return arr
  end

  #   right = arr.size-1
  #   if arr[left] < arr[right]
  #     pivot = arr.size/2.0.round
  #     new_pivot = part(arr, left, right, pivot)
  #     Array.quick_sort(arr[left..new_pivot-1])
  #     Array.quick_sort(arr[new_pivot..right])
  #   end
  #   return arr
  # end

  # def self.part(arr, left, right, pivot)
  #   arr[right], arr[pivot] = arr[pivot], arr[right]
  #   store_index = left
  #   until store_index = right
  #     if array[left] < array[pivot]
  #       array[left], array[pivot] = array[pivot], array[left]
  #       store_index += 1
  #     end
  #     arr[right], arr[store_index] = arr[store_index], arr[right]
  #   end
  #   return arr[store_index]
  # end

  # def sorted?
  #   each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  # end

end
