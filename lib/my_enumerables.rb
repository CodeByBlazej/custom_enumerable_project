module Enumerable
  # Your code goes here
  def my_each_with_index
    self.each_with_index do |elem, index|
      elem if yield(elem, index)
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
