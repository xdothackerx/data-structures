class Array

  def ins_sort
    (1..self.length-1).each do |n|
      insertion_ind = n
      insertion_val = self.delete_at(insertion_ind)
      while insertion_ind > 0 && insertion_val < self[insertion_ind-1]
        insertion_ind -= 1
      end
      self.insert(insertion_ind, insertion_val)
    end
    self
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

  def quick_sort(left = 0, right = self.size-1)
    if left < right
      pivot = (left+right)/2
      new_pivot = part(left, right, pivot)
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
