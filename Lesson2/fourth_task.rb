# Программа заполняет хеш гласными буквами и их порядковым номером

alphabet_arr = ('а'..'я').to_a
vowels = ["а", "е", "ё", "и", "о", "у", "ы", "э", "ю", "я"]
vowels_hash = { }

alphabet_arr.each { |letter|
  vowels_hash[letter] = alphabet_arr.index(letter) + 1 if vowels.include? letter }

puts vowels_hash