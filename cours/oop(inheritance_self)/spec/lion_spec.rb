# spec/animal_spec.rb
require_relative "../lion"

describe Lion do
  describe "#initialize" do
    it "creates an Lion instance" do
      simba = Lion.new("Simba")
      expect(simba).to be_an(Lion)
    end
  end

  describe '#name' do
    it "returns the name of the lion" do
      simba = Lion.new("Simba")
      expect(simba.name).to eq("Simba")
    end
  end

  describe '#talk' do
    it 'return the right sentence' do
      simba = Lion.new("Simba")
      expect(simba.talk).to eq("Simba roars")
    end
  end
end
