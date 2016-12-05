require_relative 'company_name'
require_relative 'instance_counter'
require_relative 'accessors'
require_relative 'validation'

class Train
  include CompanyName
  include InstanceCounter
  include Validation
  extend Accessors

  NUMBER_FORMAT = /^[а-я0-9]{3}.*[а-я0-9]{2}$/i

  attr_reader :number, :type, :speed, :quantity
  attr_accessor_with_history :a, :b
  strong_attr_acessor(:thing, Fixnum)

  @@trains = {}

  validate :number, :format_check, NUMBER_FORMAT
  validate :type, :presence_check

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
    register_instance
    Train.instances
    puts "Создан поезд #{@number}, тип #{@type}"
  end

  def accelerate(speed)
    @speed += speed
    puts "Поезд разогнался на #{speed}"
  end

  def current_speed
    puts "Текущая скорость #{@speed}"
  end

  def stop
    puts 'Поезд остановился!'
    @speed = 0
  end

  def add_wagon(wagon)
    if speed_zero? && wagon.type == type
      @quantity << wagon
      puts "К поезду типа #{@type} добавлен вагон типа #{wagon.type}."
      puts "Общее количество вагонов: #{@quantity.size}"
    elsif wagon.type == type && !speed_zero?
      puts 'Для начала остановите поезд!'
    elsif !wagon.type == type
      puts 'Нельзя присоединить данный вагон к этому типу поезда'
    end
  end

  def remove_wagon
    if !@quantity.empty?
      if speed_zero?
        @quantity.pop
        puts "Вагон отцеплен. Общее количество вагонов: #{@quantity.size}"
      else
        puts 'Для начала остановите поезд!'
      end
    else
      puts 'Для начала добавьте вагон'
    end
  end

  def show_wagons
    if !@quantity.empty?
      puts 'Вагоны поезда:'
      @quantity.each { |wagon| yield(wagon) }
    else
      puts 'У поезда нет вагонов'
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
      puts 'Такой станции нет!'
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

  def speed_zero?
    @speed.zero?
  end
end
