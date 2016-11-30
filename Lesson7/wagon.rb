require_relative 'company_name'

class Wagon
  include CompanyName
  attr_reader :type, :volume

  def initialize(volume, type)
    @volume = volume
    @type = type
    validate!
    puts "Создан #{@type} вагон с количеством мест: #{@volume}" if @type == "Пассажирский"
    puts "Создан #{@type} вагон с объемом: #{@volume}" if @type == "Грузовой"
  end

  def valid?
    validate!
  rescue
    false
  end

  def wagon_type
    puts "Этот вагон #{type}"
  end

  protected

  def validate!
    raise "Тип поезда должен быть 'Грузовой' или 'Пассажирский'!" if type != "Грузовой" && type != "Пассажирский"
    true
  end
end