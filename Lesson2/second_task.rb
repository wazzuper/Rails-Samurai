# Программа заполняет массив числами от 10 до 100 с шагом в 5

array = []
i = 10

while array.last != 100 do
  array.push(i)
  i += 5
end

puts "#{array}"