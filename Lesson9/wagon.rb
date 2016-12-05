require_relative 'company_name'
require_relative 'validation'

class Wagon
  include CompanyName
  include Validation
  
  attr_reader :type, :volume

  validate :type, :type_check

  def initialize(volume, type)
    @volume = volume
    @type = type
    validate!
    puts "Создан #{@type} вагон с количеством мест: #{@volume}" if @type == 'Пассажирский'
    puts "Создан #{@type} вагон с объемом: #{@volume}" if @type == 'Грузовой'
  end

  def wagon_type
    puts "Этот вагон #{type}"
  end
end
