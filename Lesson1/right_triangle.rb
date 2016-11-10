# Определяем по теореме Пифагора треугольник (равносторонний или прямоугольный)

print "Enter length of the first side: "
first_side = gets.chomp.to_i

print "Enter length of the second side: "
second_side = gets.chomp.to_i

print "Enter length of the third side: "
third_side = gets.chomp.to_i

if first_side > second_side && first_side > third_side
	hypotenuse = first_side

	if hypotenuse**2 == second_side**2 + third_side**2
		puts "This triangle is equilateral"
	else
		puts "This triangle is rectangular"
	end

elsif second_side > first_side && second_side > third_side
	hypotenuse = second_side

	if hypotenuse**2 == first_side**2 + third_side**2
		puts "This triangle is equilateral"
	else
		puts "This triangle is rectangular"
	end

else
	hypotenuse = third_side

	if hypotenuse**2 == first_side**2 + second_side**2
		puts "This triangle is equilateral"
	else
		puts "This triangle is rectangular"
	end
end
		