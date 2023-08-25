#Expected Time Complexity : O(N)
#Expected Space Complexity : O(1)
#Where N denotes size of string

#storing max element and maintain array size 4
def addAndMaintainSize(arr, num)
  if arr.size < 4
    arr.push(num)
  else
    arr.sort!
    arr[0] = [arr[0], num].max
  end
end

# calculate multiplicaion for max_combination
def calculate_multiplication(arr, max_multiplication)
  if arr.size < 4
    arr.clear
    return
  end
  cur_multiplication = 1
  
  arr.each { |num| cur_multiplication *= num }
  max_multiplication[0] = [max_multiplication[0], cur_multiplication].max
  arr.clear
end

def max_multiplication(str)
  max_multiplication = [-1]  
  vec = []
  
  str.each_char do |char|
    if char.match?(/\d/)
      addAndMaintainSize(vec, char.to_i)
    else
      calculate_multiplication(vec, max_multiplication)
    end
  end
  calculate_multiplication(vec, max_multiplication)
  
  max_multiplication[0] == -1 ? nil : max_multiplication[0]
end


puts max_multiplication("abc12345def").inspect
puts max_multiplication("abc234513d").inspect
puts max_multiplication("abc234k513d").inspect





