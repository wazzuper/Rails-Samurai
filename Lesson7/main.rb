require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class Menu
  def initialize
    @stations = []
    @trains = []
  end

  def menu_loop
    loop do
      puts "Выберите пункт в меню:"
      puts "1. Создать станцию"
      puts "2. Создать поезд"
      puts "3. Прицепить вагон к поезду"
      puts "4. Отцепить вагон от поезда"
      puts "5. Поместить поезд на станцию"
      puts "6. Показать список станций"
      puts "7. Показать список поездов на станции"
      puts "8. Показать список вагонов поездов"
      puts "9. Занять место или объем в вагоне"
      puts "10. Выход"
      menu = gets.chomp.to_i
      case menu
      when 1
        add_station
      when 2
        add_train
      when 3
        add_wagon
      when 4
        remove_wagon
      when 5
        train_to_station
      when 6
        show_stations
      when 7
        show_trains
      when 8
        show_wagons
      when 9
        take_seat_or_volume
      when 10
        break
      else
        puts "Введите число!"
      end
    end
  end

  private

  def add_station
    print "Введите название станции: "
    station = gets.chomp
    @stations << Station.new(station)
  rescue RuntimeError => e
    puts "#{e}"
    retry
  end

  def add_train
    print "Укажите номер поезда: "
    number = gets.chomp.to_s
    print "Поезд будет 'Пассажирский' или 'Грузовой'? "
    type = gets.chomp
    if type == "Пассажирский"
      @trains << PassengerTrain.new(number, type)
    elsif type == "Грузовой"
      @trains << CargoTrain.new(number, type)
    else
      puts "Неверный тип поезда!"
    end
  rescue RuntimeError => e
    puts "#{e}"
    retry
  end

  def add_wagon
    if @trains.size > 0
      puts "Выберите поезд"
      index = 0
      @trains.each { |value| puts "#{index += 1} - #{value.number} - #{value.type}" }
      choice = gets.chomp.to_i
      if choice <= @trains.size
        if @trains[choice - 1].type == "Грузовой"
          print "Укажите объем вагона: "
          volume = gets.chomp.to_i
          @trains[choice - 1].add_wagon(CargoWagon.new(volume))
        elsif @trains[choice - 1].type == "Пассажирский"
          print "Укажите общее количество мест в вагоне: "
          seats = gets.chomp.to_i
          @trains[choice - 1].add_wagon(PassengerWagon.new(seats))
        end
      else
        puts "Нет такого поезда"
      end
    else
      puts "Сначала создайте поезд"
    end
  end

  def remove_wagon
    if @trains.size > 0
      puts "Выберите поезд"
      index = 0
      @trains.each { |value| puts "#{index += 1} - #{value.number} - #{value.type}" }
      choice = gets.chomp.to_i
      if choice <= @trains.size
        @trains[choice - 1].remove_wagon
      else
        puts "Нет такого поезда"
      end
    else
      puts "Сначала создайте поезд"
    end
  end

  def train_to_station
    if @stations.size > 0 && @trains.size > 0
      puts "Выберите станцию"
      index = 0
      @stations.each { |value| puts "#{index += 1} - #{value.name}" }
      choice = gets.chomp.to_i
      if choice <= @stations.size
        puts "Выберите поезд"
        index = 0
        @trains.each { |value| puts "#{index += 1} - #{value.number} - #{value.type}" }
        train_choice = gets.chomp.to_i
          if train_choice <= @trains.size
            @stations[choice - 1].get_train(@trains[train_choice - 1])
          else
            puts "Нет такого поезда"
          end
      else
        puts "Нет такой станции"
      end
    elsif @stations.size == 0
      puts "Сначала создайте станцию"
    elsif @trains.size == 0
      puts "Сначала создайте поезд"
    end  
  end

  def show_stations
    puts "Список станций:"
    @stations.each { |value| puts value.name}
  end

  def show_trains
    if @stations.size > 0
      puts "Выберите станцию"
      index = 0
      @stations.each { |value| puts "#{index += 1} - #{value.name}" }
      choice = gets.chomp.to_i
      if choice <= @stations.size
        @stations[choice - 1].show { |train| puts "#{train.number} - #{train.type}" }
      else
        puts "Нет такой станции"
      end
    else
      puts "Сначала создайте станцию"
    end
  end

  def show_wagons
    if @trains.size > 0
      puts "Выберите поезд"
      index = 0
      @trains.each { |value| puts "#{index += 1} - #{value.number} - #{value.type}" }
      choice = gets.chomp.to_i
      if choice <= @trains.size
        index = 0
        if @trains[choice - 1].type == "Грузовой"
          @trains[choice - 1].show_wagons { |wagon| puts "#{index += 1} - #{wagon.type} вагон - объем: #{wagon.volume}" }
        elsif @trains[choice - 1].type == "Пассажирский"
          @trains[choice - 1].show_wagons { |wagon| puts "#{index += 1} - #{wagon.type} вагон - мест: #{wagon.volume}" }
        end
      else
        puts "Нет такого поезда"
      end
    else
      puts "Сначала создайте поезд"
    end
  end

  def take_seat_or_volume
    if @trains.size > 0
      puts "Выберите поезд"
      index = 0
      @trains.each { |value| puts "#{index += 1} - #{value.number} - #{value.type}" }
      choice = gets.chomp.to_i
      if choice <= @trains.size
        if @trains[choice-1].quantity.size != 0
          puts "Выберите вагон"
          index = 0
          if @trains[choice - 1].type == "Грузовой"
            @trains[choice - 1].show_wagons { |wagon| puts "#{index += 1} - #{wagon.type} вагон - объем: #{wagon.volume}" }
            cargo_choice = gets.chomp.to_i
            if cargo_choice <= @trains[choice - 1].quantity.size
              print "Укажите объем, который хотите занять: "
              volume = gets.chomp.to_i
              @trains[choice - 1].quantity[cargo_choice - 1].take_volume(volume)
              @trains[choice - 1].quantity[cargo_choice - 1].free_volume
            else
              puts "Нет такого вагона"
            end
          elsif @trains[choice - 1].type == "Пассажирский"
            @trains[choice - 1].show_wagons { |wagon| puts "#{index += 1} - #{wagon.type} вагон - мест: #{wagon.volume}" }
            pass_choice = gets.chomp.to_i
            if pass_choice <= @trains[choice - 1].quantity.size
              @trains[choice - 1].quantity[pass_choice - 1].take_seat
              @trains[choice - 1].quantity[pass_choice - 1].free_seats
            else
              puts "Нет такого вагона"
            end
          end
        else
          puts "Сначала прицепите вагоны"
        end
      else
        puts "Нет такого поезда"
      end
    else
      puts "Сначала создайте поезд"
    end
  end

end