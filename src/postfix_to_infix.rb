SIGNS = ['+', '-', '*', '/']

def postfix_to_infix(exp)
  if exp == nil || !!(exp =~ /[A-Za-z]/) || exp == ""
    return "please type a valid postfix expression"
  end
  data = exp.split(' ')
  number_of_signs = 0
  number_of_numbers = 0
  i = 0
  indexes_of_signs=[]
  numbers=[]
  while i < data.length do
    if !!(data[i] =~ /^\d{1,9}\.{0,1}\d{0,9}$/) #this is a num
      number_of_numbers += 1
      numbers << i
    elsif SIGNS.include?(data[i]) # this is a indexes_of_signs
      number_of_signs += 1
      indexes_of_signs << i
    else
      "Error: please type a valid postfix expression"
    end
    i += 1
  end
  return "Number of signs should be 1 less than the number of numbers, please type a valid postfix expression" if number_of_signs != number_of_numbers-1
  k = 0
  signs=[]
  while k < indexes_of_signs.length do
    l = indexes_of_signs[k]
    if k > 0 && ["*","/"].include?(data[l]) && ["+","-"].include?(signs[k-1])
      data[l-2] = "(" + data[l-2] + ")" if ["+","-"].include?data[l-2].split(' ')[1]
      data[l-1] = "(" + data[l-1] + ")" if ["+","-"].include?data[l-1].split(' ')[1]
    end
    signs << data[l]
    data[l-2] = "#{data[l-2]} #{data[l]} #{data[l-1]}"
    data =  data[0..l-2] + data[l+1..-1] if l < data.length - 1
    k += 1
    indexes_of_signs[k] = indexes_of_signs[k] - 2 * k if k < indexes_of_signs.length
  end
  data[l-2]
end
