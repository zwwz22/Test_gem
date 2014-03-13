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

  def foo x    #bolck
    yield x
  end

  def ensure a,b #begin ensure
    begin
      p a/b
    rescue

    ensure
      p '2'
    end
  end

  def method_missing (method_name,*args,&block)
    p "the #{method_name} is missing #{block} "
  end

end
Test.new.reverse_str('1dsadsaddsa7890',6)
a = lambda{|x| p x}
Test.new.foo 'hhhh',&a
Test.new.ensure 2,2
Test.new.kk{|k| k+1}
