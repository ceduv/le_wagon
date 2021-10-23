# spec/animal_spec.rb
require_relative "../meerkat"

describe Meerkat do
  describe "#initialize" do
    it "creates an Meerkat instance" do
      timon = Meerkat.new("Timon")
      expect(timon).to be_an(Meerkat)
    end
  end

  describe '#name' do
    it "returns the name of the meerkat" do
      timon = Meerkat.new("Timon")
      expect(timon.name).to eq("Timon")
    end
  end

  describe '#talk' do
    it 'return the right sentence' do
      timon = Meerkat.new("Timon")
      expect(timon.talk).to eq("Timon barks")
    end
  end
end
