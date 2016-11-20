class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
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
    @stations.each { |station| puts "#{station}"}
  end
end