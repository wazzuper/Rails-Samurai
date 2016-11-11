# Определяем по теореме Пифагора треугольник (равносторонний или прямоугольный)

print "Enter length of the first side: "
first_side = gets.chomp.to_f

print "Enter length of the second side: "
second_side = gets.chomp.to_f

print "Enter length of the third side: "
third_side = gets.chomp.to_f

if first_side > second_side && first_side > third_side
	hypotenuse = first_side
	cathetus1 = second_side
	cathetus2 = third_side

elsif second_side > first_side && second_side > third_side
	hypotenuse = second_side
	cathetus1 = first_side
	cathetus2 = third_side

else
	hypotenuse = third_side
	cathetus1 = first_side
	cathetus2 = second_side
end

if hypotenuse**2 == cathetus1**2 + cathetus2**2
	puts "This triangle is equilateral"
else
	puts "This triangle is rectangular"
end