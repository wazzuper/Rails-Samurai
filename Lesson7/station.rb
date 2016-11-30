class Station
  attr_reader :name
  @@all_stations = []

  def self.all
    print "Станции: #{@@all_stations}"
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all_stations << self
    puts "Объявлена станция #{name}"
  end

  def valid?
    validate!
  rescue
    false
  end

  def get_train(train)
    @trains << train
    puts "Поезд #{train.number} прибыл на станцию #{@name}"
  end

  def show(&block)
    if @trains.size > 0
      puts "Поезда на станции"
      @trains.each { |train| block.call(train) }
    else
      puts "На станции нет поездов"
    end
  end

  def train_type(type)
    train_count = 0
    @trains.each { |train| train_count += 1 if train.type == type }
    puts "Всего на станции #{train_count} поезд(а,ов) такого типа"
  end

  def go_train(train)
    @trains.delete(train)
    puts "Поезд #{train.number} уехал со станции #{@name}"
  end

  private

  def validate!
    raise "Название станции не может быть пустым!" if name.empty?
    true
  end
end