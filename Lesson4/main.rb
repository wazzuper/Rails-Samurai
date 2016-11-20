require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class Menu
  @stations = []
  @trains = []

  loop do
    puts "Выберите пункт в меню:"
    puts "1. Создать станцию"
    puts "2. Создать поезд"
    puts "3. Прицепить вагон к поезду"
    puts "4. Отцепить вагон от поезда"
    puts "5. Поместить поезд на станцию"
    puts "6. Показать список станций"
    puts "7. Показать список поездов на станции"
    menu = gets.chomp.to_i
    case menu
  end
end