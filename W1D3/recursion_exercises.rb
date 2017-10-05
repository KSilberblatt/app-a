require 'byebug'
def range(min, max)
  return [] if max < min
  return [min] if min == max - 1
  [min] + range(min + 1, max)
end
puts "------------range---------"
puts range(1,5) == [1,2,3,4]

def sum(arr)
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  arr[0] + sum(arr[1..-1])
end
puts "------------sum---------"
sum_arr = [2, 4, 8, 6]
puts sum(sum_arr) == 20

def sum_i(arr)
  return nil if arr.empty?
  total = 0
  arr.each { |num| total += num}
  total
end
puts "------------sum_i---------"
sum_arr_i = [2, 4, 8, 6]
puts sum(sum_arr_i) == 20

def exp_1(num, expo)
  return 1 if expo == 0
  num * exp_1(num, expo - 1)
end
puts "------------exp_1---------"
puts exp_1(3, 4) == 81

def exp_2(num, expo)
  return 1 if expo == 0
  return num if expo == 1
  even_exp = exp_2(num, expo / 2)
  odd_exp = num * exp_2(num, (expo - 1) / 2)
  return even_exp * even_exp if num.even?
  return odd_exp * odd_exp if num.odd?


end
puts "------------exp_2---------"
puts exp_2(3, 4) == 81

class Array

  def deep_dup
    return self.dup if self.length == 1
    self.each do |el|
      el.deep_dup if el.is_a?(Array)
    end
  end

end
puts "------------deep_dup---------"
arr = ["1", ["2"], ["3", ["4"]]]
puts arr.deep_dup == ["1", ["2"], ["3", ["4"]]]
arr_nums = [1, [2], [3, [4, 5]]]
puts arr_nums.deep_dup == [1, [2], [3, [4, 5]]]
p arr_nums.deep_dup

def fibonacci(n)
  return [0] if n <= 1
  return [0, 1] if n == 2
  arr = fibonacci(n - 1)
  current_num = sum_last_two(arr)
  arr.concat([current_num])
end

def sum_last_two(arr)
  arr[-1] + arr[-2]
end
puts "------------fibonacci---------"
puts fibonacci(3) == [0, 1, 1]


def subsets2(arr)
  return [[]] if arr.empty?
  subs = subsets2(arr.take(arr.count - 1))
  subs.concat(subs.map { |sub| sub + [arr.last] })
end

  def subsets(arr)
    return [[]] if arr.empty?
    #temp1 = [[]]

    subs = subsets(arr[0...-1])
    temp = subs.map { |e| e + [arr[-1]] }
    subs + temp
  end
puts "------------subsets---------"
#puts subsets2([1, 2, 3]) == [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
p subsets([1, 2, 3])

=begin
def permutations(arr)
  return arr if !arr[0].is_a?(Integer) && arr.length == arr[0].length.factorial #base case
  shuff = arr.shuffle
  while arr == shuff
    shuff = shuff.shuffle
  end
  return permutations([arr] + [shuff]) if arr[0].is_a?(Integer)
  random = arr[0].shuffle
  while arr.include?(random)
    random = random.shuffle
  end
  permutations(arr << random)
end
=end
def perm(arr)
  return [arr] if arr.length <= 1
  my_p = arr.each_with_index.map do |el, i|
    smaller_arr = arr[0...i] + arr[i + 1..-1]
    temp = perm(smaller_arr).flatten
    temp.unshift(el)
    temp
  end
  my_p
end


def permutations(arr)
  return [arr] if arr.length <= 1
  perms = permutations(arr[0...-1])
  last = arr.last
  new_perms = []
  perms.each do |ar|
    (ar.length + 1).times do |idx|
      temp = ar.dup
      new_perms << temp.insert(idx, last)
    end
  end
  new_perms

end

class Integer
  def factorial_recursive
    self <= 1 ? 1 : self * (self - 1).factorial
  end
  def factorial_iterative
    f = 1; for i in 1..self; f *= i; end; f
  end
  alias :factorial :factorial_iterative
end
puts "------------permutations---------"
p permutations([1, 2, 3])

def bsearch(arr, target)
  mid = arr.length / 2
  return mid if arr[mid] == target
  return nil if arr.length == 1 && arr[0] != target
  return bsearch(arr[mid..-1], target) + mid if arr[mid] < target
  return bsearch(arr[0...mid], target) if arr[mid] > target

end
puts "------------bsearch---------"
p bsearch([1, 2, 3], 1) == 0

def merge_sort(arr)
  return nil if arr.empty?
  return [arr[0]] if arr.length == 1
  mid = arr.length / 2
  merge_helper(merge_sort(arr[0...mid]), merge_sort(arr[mid..-1]))

end
def merge_helper(arr1, arr2)
  sorted_array = []
  while !arr1[0].nil? && !arr2[0].nil?
    if arr1[0] <= arr2[0]
      sorted_array << arr1.shift
    else
      sorted_array << arr2.shift
    end
  end
  sorted_array + arr1 + arr2
end
puts "------------merge_sort---------"
p merge_sort([2, 5, 3, 9, 1, 4, 8, 3, 1])

def make_change(target, coins)

end
#recursion_exercises.rb
