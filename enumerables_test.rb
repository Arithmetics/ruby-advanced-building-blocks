require "minitest/autorun"
require_relative "enumerables"



class EnumerablesTest < Minitest::Test

  def setup
    @letters = ["a", "b", "c", "d", "e"]
    @numbers = [0,1,2,3,4,5]
    @almost = ["a", "a", "a", "b"]
    @all = ["b", "b", "b"]
    @single = [1]
  end

  def test_my_each
    sentence = ""
    @letters.my_each {|x| sentence += x}
    assert sentence == "abcde"
    sum = 0
    @numbers.my_each {|x| sum += (x+1)}
    assert sum == 21
  end

  def test_my_each_with_index
    index_values = []
    number_values = []
    @numbers.my_each_with_index do |x,i|
      index_values.push(i)
      number_values.push(x+1)
    end
    assert index_values == [0,1,2,3,4,5]
    assert number_values == [1,2,3,4,5,6]
  end

  def test_my_select
    found = @letters.my_select {|x| x == "a" || x == "b"}
    assert found == ["a", "b"]
  end

  def test_my_all?
    check = @almost.my_all? {|x| x == "a"}
    refute check
    check = @all.my_all? {|x| x == "b"}
    assert check
    check = @single.my_all? {|x| x == 1}
    assert check
  end

  def test_my_any?
    check = @almost.my_any? {|x| x == "a"}
    assert check
    check = @almost.my_any? {|x| x == "z"}
    refute check
    check = @single.my_any? {|x| x == 1}
    assert check
  end

  def test_my_count
    check = @almost.my_count {|x| x == "a"}
    assert check == 3
    check = @almost.my_count {|x| x == "z"}
    assert check == 0
  end 
end
