class Train
  attr_accessor :number, :type

  def initialize(number, type, quantity, speed = 0)
    @number = number
    @type = type
    @quantity = quantity
    @speed = speed
    puts "Создан поезд #{number}, тип #{type}, c #{quantity} вагонами"
  end

  def accelerate(speed)
    @speed += speed
    puts "Поезд разогнался на #{speed}"
  end

  def current_speed
    puts "Текущая скорость #{@speed}"
  end

  def stop
    puts "Поезд остановился!"
    @speed = 0
  end

  def current_quantity
    puts "Количество вагонов: #{@quantity}"
  end

  def coupling(input)
    if @speed > 0
      puts "Для начала остановите поезд!"
    else
      case input
        when "прицепить"
          @quantity += 1
          puts "Вагон прицеплен"
        when "отцепить"
          @quantity -= 1
          puts "Вагон отцеплен"
      end
    end    
  end

  def get_route(route)
    @route = route
    @current_station = @route.stations[0]
    puts "Поезд принял маршрут, текущая станция #{@current_station}"
  end

  def to_station(station)
    if @route.stations.include?(station)
      arr_index = @route.stations.index(station)
      @current_station = @route.stations[arr_index]
      puts "Поезд переместился на станцию #{@current_station}"
    else
      puts "Такой станции нет!"
    end
  end

  def current_station
    puts "Текущая станция #{@current_station}"
  end

  def previous
    arr_index = @route.stations.index(@current_station)
    previous_station = @route.stations[arr_index - 1]
    puts "Предыдущая станция #{previous_station}"
  end

  def next
    arr_index = @route.stations.index(@current_station)
    next_station = @route.stations[arr_index + 1]
    puts "Следущая станция #{next_station}"
  end
end