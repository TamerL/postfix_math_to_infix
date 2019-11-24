SIGNS = {'+' => 0, '-' => 0 , '*' => 1, '/' => 1}

def postfix_to_infix(exp)
  if exp == nil || !!(exp =~ /[A-Za-z]/) || exp == ""
    return "please type a valid postfix expression"
  end
  data = exp.split(' ')
  result = []
  number_of_numbers = 0
  number_of_signs = 0
  data.each do |item|
    case item
    when /\d+/
      result << [item,1]
      number_of_numbers += 1
    when *SIGNS.keys
      number_of_signs += 1
      right_exp_prio = result.pop
      left_exp_prio = result.pop
      prio = SIGNS[item]
      right_exp = right_exp_prio.first
      left_exp = left_exp_prio.first
      left_exp = '(' + left_exp + ')' if left_exp_prio.last < prio
      right_exp = '(' + right_exp + ')' if right_exp_prio.last < prio
      result << [left_exp + " " + item + " " + right_exp, prio]
    end
  end
  return "Number of signs should be 1 less than the number of numbers, please type a valid postfix expression" if number_of_signs != number_of_numbers-1
  result.first.first
end
