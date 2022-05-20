class Board
  def initialize
    @board = []
  end

  def adverts
    # Returns a list of instances of advert
    return @board
  end

  def add(advert) # advert is a AdvertPost
    # No return value
    @board << advert
  end

  def get(index) # index is a number
    # Returns an advert, the advert at the given index
    return @board[index]
  end

  def update(index, new_advert) # index is a number, new_advert is a AdvertPost
    # Updates the entry at index to be the new_advert
    # Update with potential sightings
    # No return value
    @board[index] = new_advert
  end

  def remove(index) # index is a number
    # Deletes the advert at index
    @board.delete_at(index)
  end

  def update_list
    # removes all found cats from the list 
    # returns list 
    @board.each do |advert|
      if advert.found? == true
        @board.delete(advert)
      end
    end
    return @board
  end

end  
