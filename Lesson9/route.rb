require_relative 'station'
require_relative 'validation'

class Route
  include Validation

  attr_reader :stations

  validate :first, :check_type
  validate :last, :check_type

  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
    validate!
    puts "Создан маршрут #{@stations}"
  end

  def add_station(station)
    @stations.insert(-2, station)
    puts "Новая станция #{station} добавлена в маршрут"
  end

  def delete_station(station)
    @stations.delete(station)
    puts "Станция #{station} удалена"
  end

  def show
    @stations.each { |station| puts station.to_s }
  end
end
