require "test/unit"
require "../main.rb"

class TestAnagram < Test::Unit::TestCase
  
  def test_anagram
    anagram = AlphabeticAnagrams.new
    testValues = {'ABAB' => 2, 'AAAB' => 1, 'BAAA' => 4, 
                  'QUESTION' => 24572, 'BOOKKEEPER' => 10743 }
    testValues.each do |key,value|
       assert_equal(anagram.code(key), value, 'Incorrect list position: ' + key)
    end
  end

end
