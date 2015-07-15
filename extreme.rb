def solution(a)
    # Return -1 if array is empty
    return -1 if a.size == 0
    # Short array to locate extreme small and extreme large
    arr = a.sort
    sum = arr.inject{|sum,x| sum + x }
    # Convert to float number for accurate calculation
    average = sum.to_f / (arr.size).to_f
    puts average
    # Compare extreme values
    if (average - arr[0]).abs > (a[-1] - average).abs
        extreme = arr[0]
    else
        extreme = arr[-1]
    end
    # Locate the index of extreme value in the original array
    return a.index(extreme)
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
# Test false case from codility
  def test
    assert_equal 1, solution([-2147483647, 2147483647])
    assert_equal 1, solution([2, 1, 2])
    assert_equal 0, solution([1000, 1, 1, 1, 1])
  end
end