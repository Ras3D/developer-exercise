class String
  def initial
    self[0,1]
  end
end

def generate_fib_seq(n)
  if n == 1
      [1]
  elsif n == 2
      [1,1]
  else
      fibs = generate_fib_seq(n-1)
      fibs << fibs[-1] + fibs[-2]
  end
end

class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    # TODO: Implement this method
    my_array = str.scan(/[\w'-]+|[[:punct:]]+/)
    my_array2 = my_array.map{|item|
        str_len = item.length
        if str_len > 4 then
            item = item
            first_letter = item.initial
            if first_letter == first_letter.upcase then
                item = "Marklar"
            else
                item = "marklar"
            end
        else
            item = item
        end
    
    }
    new_str = my_array2.join(" ");

    #removes blank space before the ? and the .
    #not perfect since it will only work for first instance of "?" or "."
    #would be better in a loop or some regex to find and replace.
    #Works for the test case string "How is the weather today? I have not been outside."
    if new_str.include? "?" then
        index_q = new_str.index("?")-1;
        new_str.slice!(index_q);
    end
    
    if new_str.include? "." then
        index_p = new_str.index(".")-1;
        new_str.slice!(index_p);
    end

    return new_str
  end


  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    # TODO: Implement this method
    fib_arr =  generate_fib_seq(nth)
    pos = []
    fib_arr.each do |x|
        if x % 2 == 0
            pos.push x
        end
    end
    
    fin = pos.sum
    return fin
  end

end
