# spec/animal_spec.rb
require_relative "../warthog"

describe Warthog do
  describe "#initialize" do
    it "creates an Warthog instance" do
      pumbaa = Warthog.new("Pumbaa")
      expect(pumbaa).to be_an(Warthog)
    end
  end

  describe '#name' do
    it "returns the name of the warthog" do
      pumbaa = Warthog.new("Pumbaa")
      expect(pumbaa.name).to eq("Pumbaa")
    end
  end

  describe '#talk' do
    it 'return the right sentence' do
      pumbaa = Warthog.new("Pumbaa")
      expect(pumbaa.talk).to eq("Pumbaa grunts")
    end
  end
end
