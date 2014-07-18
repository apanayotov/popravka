puts 'Enter the coefficients'
puts 'Enter a: '
STDOUT.flush              
a=gets.chomp.to_f                                 
puts 'Enter b: '
STDOUT.flush 
b=gets.chomp.to_f                               
puts 'Enter c: '
STDOUT.flush 
c=gets.chomp.to_f                                 

D = b*b -4*a*c                                    

if D>=0                                                
  x1=(-b-Math.sqrt(D))/(2*a)                
  x2=(-b+Math.sqrt(D))/(2*a)               
  puts 'x1: '+x1.to_s+' x2: '+x2.to_s  
  else                                                 
    x1=(-b)/(2*a)                              
    x2=(Math.sqrt(D*(-1)))/(2*a)         
    puts 'x1: '+x1.to_s+'-i'+x2.to_s    
    puts 'x2: '+x1.to_s+'+i'+x2.to_s   
  end 