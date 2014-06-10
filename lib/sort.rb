def ins_sort(arr)
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
