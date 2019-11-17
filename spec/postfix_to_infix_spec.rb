require 'rspec/autorun'
require './src/postfix_to_infix'

describe 'postfix_to_infix' do
  context "when the input is a valid expression" do
    it "returns the answer 2 + 3 for the expression 2 3 +" do
      result = postfix_to_infix("2 3 +")
      expect(result).to eq("2 + 3")
    end
    it "returns the answer 2 * (3 + 5) for the expression 2 3 5 + *" do
      result = postfix_to_infix("2 3 5 + *")
      expect(result).to eq("2 * (3 + 5)")
    end
    it "returns the answer 56 * (34 + 213.7) - 678 for the expression 56 34 213.7 + * 678 -" do
      result = postfix_to_infix("56 34 213.7 + * 678 -")
      expect(result).to eq("56 * (34 + 213.7) - 678")
    end
    it "returns the answer 1 + (56 + 35) / (16 - 9) for the expression 1 56 35 + 16 9 - / +" do
      result = postfix_to_infix("1 56 35 + 16 9 - / +")
      expect(result).to eq("1 + (56 + 35) / (16 - 9)")
    end
    it "returns the answer 2 + 3 * 4 for the expression 2 3 4 * +" do
      result = postfix_to_infix("2 3 4 * +")
      expect(result).to eq("2 + 3 * 4")
    end
    it "returns the answer (1 + 2) * 7 for the expression 1 2 + 7 *" do
      result = postfix_to_infix("1 2 + 7 *")
      expect(result).to eq("(1 + 2) * 7")
    end
    it "returns the answer 5 / (2 + 4 - 3) * (6 - 5) * 3 for the expression 5 4 3 - 2 + / 6 5 - * 3 *" do
      result = postfix_to_infix(" 5 4 3 - 2 + / 6 5 - * 3 *")
      expect(result).to eq("5 / (4 - 3 + 2) * (6 - 5) * 3")
    end
  end

  context "when the input is having nil or letters" do
    it "returns a message" do
      result = postfix_to_infix("asdf")
      expect(result).to eq("please type a valid postfix expression")
    end
    it "returns a message" do
      result = postfix_to_infix("")
      expect(result).to eq("please type a valid postfix expression")
    end
    it "returns a message" do
      result = postfix_to_infix(nil)
      expect(result).to eq("please type a valid postfix expression")
    end
  end

  context "when the number of the operators is not one less than the number of operands" do
    it "returns a message" do
      result = postfix_to_infix("9 5 6 +")
      expect(result).to eq("Number of signs should be 1 less than the number of numbers, please type a valid postfix expression")
    end
  end
end
