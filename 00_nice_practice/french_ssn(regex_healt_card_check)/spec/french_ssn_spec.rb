require_relative '../french_ssn'

describe "french_ssn" do
  it "should return 'Invalid number' whern passed empty string" do
    result = french_ssn("")
    expected = 'Invalid number'
    expect(result).to eq(expected)
  end

  it "should return 'a man, born in December, 1984 in Seine-Maritime.' whebn passed '1 84 12 76 451 089 46'" do
    result = french_ssn("1 84 12 76 451 089 46")
    expected = 'a man, born in December, 1984 in Seine-Maritime.'
    expect(result).to eq(expected)
  end


  it "should return 'a man, born in December, 1984 in Seine-Maritime.' whebn passed '1 84 12 76 451 089 47'" do
    result = french_ssn("1 84 12 76 451 089 47")
    expected = 'Invalid number'
    expect(result).to eq(expected)
  end
end