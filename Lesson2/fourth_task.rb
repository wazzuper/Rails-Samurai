# Программа заполняет хеш гласными буквами и их порядковым номером

alphabet_arr = ('а'..'я').to_a
vowels = { }

alphabet_arr.each do |letter|
  case letter
  when "а", "е", "ё", "и", "о", "у", "ы", "э", "ю", "я"
    vowels[letter.to_sym] = alphabet_arr.index(letter) + 1
  end
end

puts vowels