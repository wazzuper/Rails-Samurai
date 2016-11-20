class Wagon
  attr_reader :type

  def initialize(type)
    @type = type
    puts "Создан #{@type} вагон"
  end

  def wagon_type
    puts "Этот вагон #{type}"
  end
end