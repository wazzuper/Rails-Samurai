class PassengerWagon < Wagon
  def initialize(seats, type = 'Пассажирский')
    @overall_seats = seats.to_i
    @seats_count = 0
    super
  end

  def take_seat
    @seats_count += 1 if @overall_seats > @seats_count
    puts 'Одно место заняли'
  end

  def show_seats
    puts "Количество занятых мест: #{@seats_count}"
  end

  def free_seats
    puts "Колчество свободных мест: #{@overall_seats - @seats_count}"
  end
end
