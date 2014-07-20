require "pdfkit"

def generate_quadratic 
	pool = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']

	return "#{pool.sample}x^2 + #{pool.sample}x + #{pool.sample}"
end

def generate_cubic
	pool = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']

	return "#{pool.sample}x^3 + #{pool.sample}x^2 + #{pool.sample}x + #{pool.sample}"
end

def make_html_and_pdf equations
	myfile = File.new("equations.html", "w+") 

	myfile.puts "<html>"
	myfile.puts "<title>Equations</title>"
	myfile.puts "<style>body > div{clear:both;float:left; width:500px;}</style>"
	myfile.puts "<body style=\"padding: 15px;\">"
	
	equations.each_with_index do |e,index|
		myfile.puts "#{e}"
		myfile.puts "<br><br>"	
	end 

	myfile.puts "</body>"
	myfile.puts "</html>"

	kit = PDFKit.new(myfile)
	kit.to_file("equations.pdf")
	
end



print "Enter how many test you want = "

user_input = gets.chomp
user_input =  user_input.to_i

equations = Array.new

user_input.times do 
	equations << generate_quadratic
	equations << generate_cubic
end

make_html_and_pdf equations
