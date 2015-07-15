# User Lastin -lastout stack to trace pattern
def solution(s)
    arr = s.split('')
    stack = []
    stack << arr[0]
    (1..arr.size-1).each do |i| 
        if (stack.last == "A" && arr[i] == "B") || (stack.last == "B" && arr[i] == "A") || (stack.last == "A" && arr[i] == "A")
            stack[-1] = "A"
        elsif (stack.last == "C" && arr[i] == "B") || (stack.last == "B" && arr[i] == "C") || (stack.last == "C" && arr[i] == "C")
            stack[-1] = "C"
        else
            stack << arr[i]
        end
    end
    return stack.join('')
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test
    assert_equal 'AC', solution('ABBCC')
    assert_equal 'AC', solution('ACBCB')
    assert_equal 'A', solution('AA')
    assert_equal 'ACACA', solution('ABCBCACAA')
    assert_equal 'AC'*10000, solution('AC'*10000)
    assert_equal 'A', solution('A'*10000)
    assert_equal 'BBBBB', solution('BBBBB')
    assert solution('ACBAC'*1000).length > 0
    assert_equal 'AC', solution('A'*5000+'C'*5000)
    assert solution('ACBAC'*100000).length > 0
  end
end