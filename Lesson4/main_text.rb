require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

train1 = Train.new(55534, "Грузовой")
train2 = Train.new(5334, "Грузовой")
train3 = CargoTrain.new(13123)
train4 = PassengerTrain.new(123)

wagon1 = CargoWagon.new
wagon2 = PassengerWagon.new
wagon3 = CargoWagon.new
wagon1.wagon_type
wagon2.wagon_type
wagon3.wagon_type

train3.add_wagon(wagon1)
train3.add_wagon(wagon2)
train3.add_wagon(wagon3)

train4.add_wagon(wagon1)
train4.add_wagon(wagon2)

train3.current_quantity
train3.remove_wagon
train3.current_quantity
train2.remove_wagon

station1 = Station.new("Гуделкино")
station1.get_train(train1)
station1.get_train(train2)
station1.show
station1.train_type("Грузовой")
station1.go_train(train1)

route1 = Route.new("Иваново", "Кукуево")
route1.add_station("Шариково")
route1.show

train1.route = route1
train1.to_station("Шариково")
train1.current_station
train1.previous
train1.next

train1.accelerate(50)
train1.current_speed  
train1.stop



