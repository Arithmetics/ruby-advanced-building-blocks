def bubble_sort_by(arr)
  swapped = true
    while swapped == true
      swapped = false
      arr.each_with_index do |x, i|
        if arr[i+1]
          x = yield(arr[i], arr[i+1])
          if x > 0
            holder = arr[i]
            arr[i] = arr[i+1]
            arr[i+1] = holder
            swapped = true
          end
        end
      end
    end
  arr
end
