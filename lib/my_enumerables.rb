module Enumerable
  # Your code goes here
  def my_each_with_index
    self.each_with_index do |elem, index|
      elem if yield(elem, index)
    end
  end

  def my_select
    arr = []
    self.my_each do |value|
      arr << value if yield(value)
    end
    arr
  end

  def my_all?
    self.my_each do |value|
      return false unless yield(value)
    end
    true
  end

  def my_any?
    self.my_each do |value|
      return true if yield(value)
    end
    false
  end

  def my_none?
    self.my_each do |value|
      return false if yield(value)
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |value|
        count += 1 if yield(value)
      end
    else
      count = self.size
    end
    count
  end

  def my_map
    arr = []
    self.my_each do |value|
      arr << yield(value)
    end
    arr
  end

  def my_inject(initial_value)
    accumulator = initial_value
    self.my_each do |elem|
      accumulator = yield(accumulator, elem)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |elem|
      elem if yield(elem)
    end

    self
  end
end
