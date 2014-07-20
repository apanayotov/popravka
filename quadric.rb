def generate_quadratic 
	pool = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']

	return "#{pool.sample}x^2 + #{pool.sample}x + #{pool.sample}"
end


def make_pdf 

end

def make_html

end



print "Enter how many test you want"

user_input = gets.chomp
user_input =  user_input.to_i

equations = Array.new

user_input.times do 
	equations << generate_quadratic
end

