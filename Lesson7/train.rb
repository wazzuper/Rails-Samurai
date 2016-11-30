require_relative 'company_name'
require_relative 'instance_counter'

class Train
  include CompanyName
  include InstanceCounter
  attr_reader :number, :type, :speed, :quantity
  @@trains = {}

  NUMBER_FORMAT = /^[а-я0-9]{3}.*[а-я0-9]{2}$/i

  def self.find(number)
    puts @@trains[number]
  end

  def initialize(number, type)
    @number = number
    @type = type
    @quantity = []
    @speed = 0
    validate!
    @@trains[number] = self
    self.register_instance
    Train.instances
    puts "Создан поезд #{@number}, тип #{@type}"
  end

  def valid?
    validate!
  rescue
    false
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

  def add_wagon(wagon)
    if speed_zero? && wagon.type == self.type
      @quantity << wagon
      puts "К поезду типа #{@type} добавлен вагон типа #{wagon.type}. Общее количество вагонов: #{@quantity.size}"
    elsif wagon.type == self.type && !speed_zero?
      puts "Для начала остановите поезд!"
    elsif !wagon.type == self.type
      puts "Нельзя присоединить данный вагон к этому типу поезда"
    end
  end

  def remove_wagon
    if @quantity.size > 0
      if speed_zero?
        @quantity.pop
        puts "Вагон отцеплен. Общее количество вагонов: #{@quantity.size}"
      else
        puts "Для начала остановите поезд!"
      end
    else
      puts "Для начала добавьте вагон"
    end
  end

  def show_wagons(&block)
    if @quantity.size > 0
      puts "Вагоны поезда:"
      @quantity.each { |wagon| block.call(wagon) }
    else
      puts "У поезда нет вагонов"
    end
  end

  def route=(route)
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

protected

  def validate!
    raise "Номер не может быть nil!" if number.nil?
    raise "Номер должнен состоять минимум из 5 символов!" if number.to_s.length < 5
    raise "Невалидный номер!" if number !~ NUMBER_FORMAT
    raise "Тип поезда не может быть nil!" if type.nil?
    raise "Тип поезда должен быть 'Грузовой' или 'Пассажирский'!" if type != "Грузовой" && type != "Пассажирский"
    true
  end

  def speed_zero?
    @speed.zero?
  end
end