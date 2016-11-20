class CargoTrain < Train
  def initialize(number, type = "Грузовой")
    super
  end

  private

  def same_wagon?(wagon)
    wagon.class == CargoWagon
  end
end