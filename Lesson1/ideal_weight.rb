# Находим идеальный вес

print "What is your name? "
name = gets.chomp

print "Enter your height: "
height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight > 0
	puts "#{name}, your ideal weight is #{ideal_weight}"
else
	puts "Your weight is already optimal"
end