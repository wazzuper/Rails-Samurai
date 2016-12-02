require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'company_name'
require_relative 'instance_counter'

train1 = Train.new('РВГ-232', 'Грузовой')
train2 = Train.new('ИВЕ42', 'Грузовой')
train3 = CargoTrain.new('ФЫВ23')
train4 = PassengerTrain.new('123НГ')

wagon1 = CargoWagon.new(5550)
wagon1.wagon_type
wagon1.take_volume(2500)
wagon1.show_volume
wagon1.free_volume

wagon2 = PassengerWagon.new(55)
wagon2.wagon_type
wagon2.take_seat
wagon2.show_seats
wagon2.free_seats

wagon3 = CargoWagon.new(2324)
wagon3.wagon_type

train3.add_wagon(wagon1)
train3.add_wagon(wagon2)
train3.add_wagon(wagon3)

train4.add_wagon(wagon1)
train4.add_wagon(wagon2)

train3.show_wagons { |wagon| puts "#{wagon.type} вагон - объем: #{wagon.volume}" }
train3.remove_wagon
train3.show_wagons { |wagon| puts "#{wagon.type} вагон - объем: #{wagon.volume}" }

station1 = Station.new('Гуделкино')
station1.get_train(train1)
station1.get_train(train2)
station1.show { |train| puts "#{train.number} - #{train.type}" }
station1.train_type('Грузовой')
station1.go_train(train1)
station2 = Station.new('Кряково')
station3 = Station.new('Грязево')

route1 = Route.new(station1, station2)
route1.add_station(station3)
route1.show
route1.valid?

train1.route = route1
train1.to_station(station2)
train1.current_station
train1.previous
train1.next

train1.accelerate(50)
train1.current_speed
train1.stop

train1.company_name = 'Pepsi'
puts train1.company_name

puts Station.all
Train.find(train1.number)
