require_relative "../slot_machine"

def test_scenario(reels, expected_result)
  it "returns #{expected_result} if #{reels.join(', ')}" do
      slot_machine = SlotMachine.new(reels)
      expect(slot_machine.score).to eq(expected_result)
    end
end


describe SlotMachine do
  describe "#score" do

    it 'returns 0 if all three are different' do
      slot_machine = SlotMachine.new(["joker", "bell", "cherry"])
      expect(slot_machine.score).to eq(0)
    end

    test_scenario(["joker", "joker", "joker"], 50)
    test_scenario(["star", "star", "star"], 40)
    test_scenario(["bell", "bell", "bell"], 30)
    test_scenario(["seven", "seven", "seven"], 20)
    test_scenario(["cherry", "cherry", "cherry"], 10)

    ["star", "bell", "seven", "cherry"].each do |symbol|
      test_scenario(["joker", "joker", symbol], 25)
    end

    test_scenario(["joker", "star", "star"], 20)
    test_scenario(["joker", "bell", "bell"], 15)
    test_scenario(["joker", "seven", "seven"], 10)
    test_scenario(["joker", "cherry", "cherry"], 5)
  end
end
