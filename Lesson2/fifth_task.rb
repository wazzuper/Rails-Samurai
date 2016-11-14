# Программа выводит порядковый номер даты введеной пользователем

puts "Enter date like dd/m/yyyy"
print "Enter day: "
day = gets.chomp.to_i
print "Enter month: "
month = gets.chomp.to_i
print "Enter year: "
year = gets.chomp.to_i

feb = 29 if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
feb = 28
array_months = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

day_number = 0
index = 1

while index < month
  day_number += array_months[index]
  index += 1
end

day_number += day

puts "#{day_number} day from the start"