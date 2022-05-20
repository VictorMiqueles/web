class AnimalList
  def initialize
    @animals = []
  end

  def list
    return @animals
  end

  def add(species)
    @animals << species
  end

  def remove(index)
    @animals.delete_at(index)
  end

  def update(index, species)
    @animals[index] = species
  end

  def get(index)
    return @animals[index]
  end
end
