# Программа выводит на экран хеш с названием товара, цены за ед. товара и
# кол-во купленного товара; итоговую сумму за каждый товар; сумму всех покупок


purchases = {}
purchases_sum_in_total = 0
puts "Enter stop in 'name of product' to leave"

loop do
  puts "Enter name of product"
  product = gets.chomp
  break if product == "stop"

  puts "Enter price per one product"
  price_one = gets.chomp.to_f

  puts "Enter amount of purchased goods"
  amount = gets.chomp.to_i

  purchases[product] = { price: price_one, amount: amount }
end

puts "Your list of purchases: #{purchases}"

purchases.each do |product, inner_hash|
  sum = inner_hash[:price] * inner_hash[:amount]
  purchases_sum_in_total += sum
  puts "#{product} in total will be #{sum}"
end

puts "In total your purchases costs #{purchases_sum_in_total}"