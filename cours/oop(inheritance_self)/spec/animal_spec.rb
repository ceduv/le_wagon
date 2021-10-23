# spec/animal_spec.rb
require_relative "../animal"

describe Animal do
  describe "#initialize" do
    it "creates an Animal instance" do
      animal = Animal.new("Test")
      expect(animal).to be_an(Animal)
    end
  end

  describe '#name' do
    it "returns the name of the animal" do
      animal = Animal.new("Test")
      expect(animal.name).to eq("Test")
    end
  end

  describe '::phyla' do
    it 'return the array of the 5 phyla' do
      expect(Animal.phyla.size).to eq(5)
    end
  end
end
