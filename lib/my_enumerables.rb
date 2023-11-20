module Enumerable
  def my_each_with_index
    index = 0

    for element in self
      yield(element, index)
      index += 1
    end

  end

  def my_select
    array = []

    for element in self
      array << element if yield(element)
    end

    array
  end

  def my_all?
    result = true

    self.my_each do |element|

      unless yield(element)
        result = false
        break
      end

    end

    result
  end

  def my_any?
    result = false

    self.my_each do |element|

      if yield(element)
        result = true
        break
      end

    end

    result
  end

  def my_none?
    result = true

    self.my_each do |element|

      if yield(element)
        result = false
        break
      end

    end

    result
  end

  def my_count
    result = 0

    self.my_each do |element|

      if block_given?

        if yield(element)
          result += 1
        end

      else
        result += 1
      end

    end

    result
  end

  def my_map
    array = []

    self.my_each do |element|
      array << yield(element)
    end

    array
  end

  def my_inject(initial)

    self.my_each do |element|
      sum = yield(element, initial)
      initial = sum
    end

  initial
  end
end

class Array
  def my_each
    for element in self
      yield(element)
    end
  end
end
