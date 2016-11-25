require_relative 'company_name'

class Wagon
  include CompanyName
  attr_reader :type

  def initialize(type)
    @type = type
    validate!
    puts "Создан #{@type} вагон"
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