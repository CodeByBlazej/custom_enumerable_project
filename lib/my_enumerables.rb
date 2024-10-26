module Enumerable
  # Your code goes here
  def my_each_with_index
    self.each_with_index do |elem, index|
      elem if yield(elem, index)
    end
  end

  def my_select
    self.select do |value|
      value if yield(value)
    end
  end

  def my_all?
    self.all? do |value|
      value if yield(value)
    end
  end

  def my_any?
    self.any? do |value|
      value if yield(value)
    end
  end

  def my_none?
    self.none? do |value|
      value if yield(value)
    end
  end

  def my_count
    self.count do |value|
      if block_given?
        value if yield(value)
      else
        self.size
      end
    end
  end

  def my_map
    self.map do |value|
      yield(value)
    end
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
