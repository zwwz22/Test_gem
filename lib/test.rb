class Test

  def right(str,a)
    if a <= str.length
      p "#{str[a..str.length-1]}#{str[0..a-1]}"
    else
      p str
    end
  end

  def reverse_str(str,a)
    if a <= str.length
      p (str[0..a-1].reverse + str[a..str.length-1].reverse).reverse
    else
      p str
    end
  end
end
Test.new.reverse_str('1dsadsaddsa7890',6)
