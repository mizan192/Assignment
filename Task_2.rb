def bitCount(num)
  count = 0
  while num > 0
    count += 1 if num % 2 == 1
    num /= 2
  end
  count
end

#Expected Time Complexity : O(N*logN)
#Expected Space Complexity : O(N)
#Where N denotes size of container

def sortByBitCount(arr)
  sorted_pairs = []

  arr.each do |num|
    count_num = bitCount(num)
    sorted_pairs << [count_num, num]
  end

  sorted_pairs.sort_by! { |count, num| [count, num] }

  sorted_pairs.each do |count, num|
    print "#{num} "
  end
end

#without built in sort approach
#this approach related to counting sort method
#Expected Time Complexity : O(N)
#Expected Space Complexity : O(N)

def sortByBitCountWithCountingSort(arr)
  count = Array.new(32) { [] }
  bit_count = 0
  
  arr.each do |num|
    bit_count = bitCount(num)
    count[bit_count].push(num)
  end
  
  position = 0
  count.each do |childArr|
    childArr.each do |num|
      arr[position] = num
      position += 1
    end
  end
  arr.each { |num| print "#{num} " }
end

arr = [3, 7, 8, 9]
sortByBitCount(arr)
puts "\n"
sortByBitCountWithCountingSort(arr)
