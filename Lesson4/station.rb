class Station
  def initialize(name)
    @name = name
    @trains = []
    puts "Объявлена станция #{name}"
  end

  def get_train(train)
    @trains << train
    puts "Поезд #{train.number} прибыл на станцию #{@name}"
  end

  def show
    puts "Поезда на станции"
    @trains.each { |train| puts "#{train.number}" }
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
end