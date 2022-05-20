require "animal_list"

RSpec.describe AnimalList do
  it "start with an empty list" do
    expect(subject.list).to eq []
  end

  it "adds animals" do
    subject.add("cat")
    expect(subject.list).to eq ["cat"]
  end

  it "removes examples" do
    subject.add("cat")
    subject.add("dog")
    subject.add("frog")
    subject.remove(1)
    expect(subject.list).to eq ["cat", "frog"]
  end

  it "updates examples" do
    subject.add("cat")
    subject.add("dog")
    subject.add("frog")
    subject.update(1, "zebra")
    expect(subject.list).to eq ["cat", "zebra", "frog"]
  end

  it "gets a single animal" do
    subject.add("cat")
    subject.add("dog")
    subject.add("frog")
    expect(subject.get(1)).to eq "dog"
  end
end
