# Поиск дискриминанта и корней

print "Enter a: "
a = gets.chomp.to_f

print "Enter b: "
b = gets.chomp.to_f

print "Enter c: "
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d > 0
	x1 = (-b + Math.sqrt(d)) / (2 * a)
	x2 = (-b - Math.sqrt(d)) / (2 * a)

	puts "Discriminant is #{d}"
	puts "First root is #{x1}"
	puts "Second root is #{x2}"
elsif d == 0
	x = -b / (2 * a)

	puts "Discriminant is #{d}"
	puts "Root is #{x}"
else
	puts "No roots"
end
		
