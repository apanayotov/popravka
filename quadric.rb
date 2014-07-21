require "pdfkit"

pool = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

def generate_quadratic pool
	return "#{pool.sample}x^2 + #{pool.sample}x + #{pool.sample}"
end

def generate_cubic pool 
	return "#{pool.sample}x^3 + #{pool.sample}x^2 + #{pool.sample}x + #{pool.sample}"
end

def solving_quadratics equations
	temp = equations.split
	a = temp[0][0].to_i
	b = temp[2][0].to_i
	c = temp[4].to_i
	d = (b*b)-(4*a*c)
end

def make_html_and_pdf equations, n
	filename="test_#{n}"
	myfile = File.new(filename+".html", "w+") 

	myfile.puts "<html>"
	myfile.puts "<title>Equations</title>"
	myfile.puts "<style>body > div{clear:both;float:left; width:500px;}</style>"
	myfile.puts "<body style=\"padding: 15px;\">"
	myfile.puts "<h1>Test Number #{n}</h1>"
	
	equations.each_with_index do |e,index|
		myfile.puts "#{index}) "
myfile.puts "#{e}"
myfile.puts "<br><br>"	
end 
#p equations.class
#p equations

myfile.puts "</body>"
myfile.puts "</html>"

kit = PDFKit.new(myfile)
kit.to_file(filename+".pdf")

end



print "Enter how many test you want = "

user_input = gets.chomp
user_input =  user_input.to_i

equations = Array.new

user_input.times do |n|
	equations = [] 
	10.times do 
		quadric = (generate_quadratic pool)
		cubic = (generate_cubic pool)
		equations << quadric
		solving_quadratics quadric
		equations << cubic
	end

	make_html_and_pdf equations, n
end
