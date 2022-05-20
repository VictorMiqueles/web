require 'board' 
require 'advert_post'

RSpec.describe Board do
  it "Adds and lists a single advert" do
    advert_post = AdvertPost.new("07364843763", "Ginger cat")
    board = Board.new
    board.add(advert_post)
    expect(board.adverts).to eq [advert_post]
  end 

  it "Adds and lists a mutiple advert" do
    advert_post1 = AdvertPost.new("07364843763", "Ginger cat")
    advert_post2 = AdvertPost.new("07364843766", "Black cat")
    advert_post3 = AdvertPost.new("07364843769", "White cat")

    board = Board.new
    board.add(advert_post1)
    board.add(advert_post2)
    board.add(advert_post3)

    expect(board.adverts).to eq [
      advert_post1,
      advert_post2,
      advert_post3
    ]
  end 

  it "removes board entires at particular index" do
    advert_post1 = AdvertPost.new("07364843763", "Ginger cat")
    advert_post2 = AdvertPost.new("07364843766", "Black cat")
    advert_post3 = AdvertPost.new("07364843769", "White cat")

    board = Board.new
    board.add(advert_post1)
    board.add(advert_post2)
    board.add(advert_post3)

    board.remove(1)
    expect(board.adverts).to eq [advert_post1, advert_post3]
  end

  it "gets a single entry" do
    advert_post1 = AdvertPost.new("07364843763", "Ginger cat")
    advert_post2 = AdvertPost.new("07364843766", "Black cat")
    advert_post3 = AdvertPost.new("07364843769", "White cat")

    board = Board.new
    board.add(advert_post1)
    board.add(advert_post2)
    board.add(advert_post3)

    expect(board.get(1)).to eq advert_post2
  end
end 