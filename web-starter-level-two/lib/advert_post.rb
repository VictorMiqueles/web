class AdvertPost
  def initialize(number, description)
  @number = number
  @description = description
  @found = false
  end
    
  def number
    return @number
  end

  def description
    return @description
  end

  def found?
    return @found
  end
        
  def been_found
    @found = true
  end

end