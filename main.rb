class AlphabeticAnagrams
  
  def initialize
    @char = []
    @str_char = []
  end
  
  def code(str)
    error = validates(str)
    if error.empty? then
      calculate(str)   
    else
      puts error  
    end 
  end
  
  private

  MAX_LENGTH = 25

  def combine(syml)    
    sum = 0
    h = {}
    
    numer = factorial(@char.length - 1)
    
    @char.uniq.each do |uniq_val|
      break if uniq_val == syml
      
      @char.each do |hash_key|
        if h[hash_key].nil? 
          h[hash_key] = 1
        else
          h[hash_key] += 1
        end     
      end    
      h[uniq_val] -= 1
      
      denom = 1
      h.each_value{ |value| denom *= factorial(value) } 
      h.clear
      sum += numer / denom
    end
    sum
  end
  
  def factorial(n)
    return 1 if n <= 1
    n * factorial(n - 1)
  end
  
  def calculate(str)
    str_code = 1
    @char = str.chars.to_a.sort!
    @str_char = str.chars.to_a
    
    @str_char.each do |x| 
      delete_index = @char.index(x)
      str_code += combine x
      @char.delete_at(delete_index)
    end
    str_code
  end 

  def validates(str)
    error = []
    error.push("The bad length!") if ( str.length > MAX_LENGTH )
    error.push("The bad string!") unless str.match(/[^A-Z]/).nil?     
    return error
  end

end
