require_relative 'station'
require_relative 'route'
require_relative 'train'

train1 = Train.new(55534, "Грузовой", 50)
train2 = Train.new(5334, "Грузовой", 30)

station1 = Station.new("Гуделкино")
station1.get_train(train1)
station1.get_train(train2)
station1.show
station1.train_type("Грузовой")
station1.go_train(train1)

route1 = Route.new("Иваново", "Кукуево")
route1.add_station("Шариково")
route1.show

train1.get_route(route1)
train1.to_station("Шариково")
train1.current_station
train1.previous
train1.next

train1.accelerate(50)
train1.current_speed
train1.stop
train1.current_quantity
train1.coupling("прицепить")
train1.coupling("отцепить")





