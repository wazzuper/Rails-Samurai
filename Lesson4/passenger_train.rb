class PassengerTrain < Train
  def initialize(number, type = "Пассажирский")
    super
  end

  private

  def same_wagon?(wagon)
    wagon.class == PassengerWagon
  end
end