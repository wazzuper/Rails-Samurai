require_relative 'station'

class Route
  attr_reader :stations

  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
    validate!
    puts "Создан маршрут #{@stations}"
  end

  def valid?
    validate!
    puts 'yes'
  rescue
    false
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

  private

  def validate!
    raise 'Не объект Station!' unless @first.instance_of?(Station)
    raise 'Не объект Station!' unless @last.instance_of?(Station)
    raise 'Маршрут станций не может быть пустым!' if stations.empty?
    true
  end
end
