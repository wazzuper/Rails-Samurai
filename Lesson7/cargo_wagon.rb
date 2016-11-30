class CargoWagon < Wagon
  def initialize (volume, type = "Грузовой")
    @overall_volume = volume.to_i
    @volume_count = 0
    super
  end

  def take_volume(volume)
    @volume_count += volume if @overall_volume > @volume_count
  end

  def show_volume
    puts "Занимаемый объем: #{@volume_count}"
  end

  def free_volume
    puts "Свободный объем: #{@overall_volume - @volume_count}"
  end
end