SIGNS = ['+', '-', '*', '/']

def postfix_to_infix(exp)
  if exp == nil || !!(exp =~ /[A-Za-z]/) || exp == ""
    return "please type a valid postfix expression"
  end
  puts exp
  data = exp.split(' ')
  number_of_signs = 0
  number_of_numbers = 0
  puts data
  i = 0
  signs=[]
  numbers=[]
  while i < data.length do
    if !!(data[i] =~ /^\d{1,9}\.{0,1}\d{0,9}$/) #this is a num
      number_of_numbers += 1
      puts "number_of_numbers #{number_of_numbers}"
      puts "#{data[i]}"
      numbers << i
    elsif SIGNS.include?(data[i]) # this is a SIGNS
      number_of_signs += 1
      signs << i
      puts "number_of_signs #{number_of_signs}"
    else
      "Error: please type a valid postfix expression"
    end
    i += 1
  end
  puts "number_of_numbers #{number_of_numbers}"
  puts "number_of_signs #{number_of_signs}"
  puts "signs #{signs}"
  puts "numbers #{numbers}"
  return "Number of signs should be 1 less than the number of numbers, please type a valid postfix expression" if number_of_signs != number_of_numbers-1
  result =[]
  k = 0
  while k < signs.length do
    l = signs[k]
    puts "while K:#{k} & L:#{l}"
    puts "data #{data}"
    result << "#{data[l-2]} #{data[l]} #{data[l-1]}" if k >= 0
    if  l < data.length - 1 && (["+","-"].include?(data[l]) && ["*","/"].include?(data[signs[k+1] - 2*k]) || ["+","-"].include?(data[l]) && ["+","-"].include?(data[signs[k+1] - 2*k]) && ["*","/"].include?(data[signs[k+2]-2*k]))
      result[-1] = "(" + result[-1] + ")"
    end
    puts "result #{result}"
    puts "data le7ad l-2 #{data[0...l-2]}"
    puts "data men l+1 #{data[l+1...-1]}"
    puts l
    temp =  data[0...l-2] << result[-1]
    data = temp + data[l+1..-1] if l < data.length - 1
    k += 1
    signs[k] = signs[k] - 2 * k if k < signs.length
    puts "data: #{data}"
    puts "result: #{result}"
    puts "signs: #{signs} "
  end
  result[-1]
end
