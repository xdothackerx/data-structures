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

  def quick_sort(left = 0, right = self.size-1)

    if left < right
      pivot = rand(left...right)
      new_pivot = part(left, right, pivot)
      # binding.pry
      self.quick_sort(left, new_pivot-1)
      self.quick_sort(new_pivot+1, right)
    end
    self
  end

  def part(left, right, pivot)
    pivot_value = self[pivot]
    self[right], self[pivot] = self[pivot], self[right]
    store_index = left
    (left...right).each do |n|
      if self[n] < pivot_value
        self[n], self[store_index] = self[store_index], self[n]
        store_index += 1
      end
    end
    self[right], self[store_index] = self[store_index], self[right]
    store_index
  end

  def sorted?
    each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  end

end


 #   left = 0
  #   right = arr.size-1
  #   pivot = arr.size/2.0.round
  #   until left == arr.size-1
  #     if arr[left] > arr[pivot]
  #       arr[right], arr[left] = arr[left], arr[right]
  #       left+=1
  #       right-=1
  #     else
  #       left += 1
  #     end
  #     puts arr[pivot]
  #     puts arr[left]
  #     puts arr[right]
  #     puts arr.inspect
  #   end
  #   # until pivot == 0
  #   #   if arr[pivot] > arr[pivot+1]
  #   #     arr[pivot], arr[pivot+1] = arr[pivot+1], arr[pivot]
  #   #     pivot += 1
  #   #   end
  #   #   puts arr[pivot]
  #   #   puts arr[left]
  #   #   puts arr[right]
  #   #   puts arr.inspect
  #   # end
  #   return arr
  # end
