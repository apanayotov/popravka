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
	if  d > 0
		x1 = (-b+Math.sqrt(d))/(2*a)
		x2 = (-b-Math.sqrt(d))/(2*a)
		return x1,x2
	else
		return "NRK"
	end
end

def make_html_and_pdf_answers answers, n 
	filename="test_answers_#{n}"
	myfile = File.new(filename+".html", "w+") 

	myfile.puts "<html>"
	myfile.puts "<title>Equations</title>"
	myfile.puts "<style>body > div{clear:both;float:left; width:500px;}</style>"
	myfile.puts "<body style=\"padding: 15px;\">"
	myfile.puts "<h1>Test Number #{n}</h1>"
	
	answers.each_with_index do |e,index|
		myfile.puts "#{index}) "
	e.each do |s|
		if (s != "......") && (s != "NRK")
			myfile.puts "x1= #{s[0]} x2=#{s[1]} "
		else
			myfile.puts"#{s}"
		end

	end

myfile.puts "<br><br>"	
myfile.puts "</body>"
myfile.puts "</html>"
end
kit = PDFKit.new(myfile)
kit.to_file(filename+".pdf")

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
answers = Array.new

user_input.times do |n|
	equations = [] 
	answers = []
	10.times do 
		quadric = (generate_quadratic pool)
		cubic = (generate_cubic pool)
		equations << quadric+" = 0"
		answers << [(solving_quadratics quadric)]
		equations << cubic +" = 0"
		answers << [("......")]
	end
p answers	
	make_html_and_pdf_answers((answers),n)	
	make_html_and_pdf equations, n
end
