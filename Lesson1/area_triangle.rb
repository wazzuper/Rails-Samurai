# Находим площадь треугольника

print "Enter base of a triangle: "
base = gets.chomp

print "Enter height of a triangle: "
height = gets.chomp

area = 0.5 * base.to_f * height.to_f

puts "Area of a triangle is #{area}"