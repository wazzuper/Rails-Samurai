# Программа выводит месяцы с количеством дней равным 30

months = { january: 31, february: 28, march: 31, april: 30, may: 31, june: 30,
  july: 31, august: 31, september: 30, october: 31, november: 30, december: 30 }

months.each do |key, value|
  if value == 30
    puts key
  end
end