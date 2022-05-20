require 'advert_post'

RSpec.describe AdvertPost do
    it "Constructs and accesses fields" do
      advert_post = AdvertPost.new("number", "description")
      expect(advert_post.number).to eq "number"
      expect(advert_post.description).to eq "description"
    end

end