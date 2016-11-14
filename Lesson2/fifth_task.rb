# Программа выводит порядковый номер даты введеной пользователем

puts "Enter date like dd/m/yyyy"
print "Enter day: "
day = gets.chomp.to_i
print "Enter month: "
month = gets.chomp.to_i
print "Enter year: "
year = gets.chomp.to_i

normal_year = { 1=>31, 2=>28, 3=>31, 4=>30, 5=>31, 6=>30,
  7=>31, 8=>31, 9=>30, 10=>31, 11=>30, 12=>31 }
leap_year = { 1=>31, 2=>29, 3=>31, 4=>30, 5=>31, 6=>30,
  7=>31, 8=>31, 9=>30, 10=>31, 11=>30, 12=>31 }
day_number = 0

if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
  leap_year.each do |key, value|
    if key < month
      day_number += value
    end
  end
else
  normal_year.each do |key, value|
    if key < month
      day_number += value
    end
  end
end

day_number += day

puts "#{day_number} day from the start"