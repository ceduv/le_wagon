require_relative '../acronymize.rb'

describe "#acronymize" do
  # should return an empty string when passed and empty string
  it("returns an empty string when passed an empty string") do
    actual = acronymize("")
    expected = ""
    expect(actual).to eq(expected) # passes if `actual == expected`
  end
  # should return the acronym on downcased sentences
  it 'should return the acronym on downcased sentences' do
    actual = acronymize("working from home")
    expected = "WFH"
    expect(actual).to eq(expected) # passes if `actual == expected`
  end
  # should return the acronym on upcased sentences
  it 'should return the acronym on downcased sentences' do
    actual = acronymize("WORKING FROM HOME")
    expected = "WFH"
    expect(actual).to eq(expected) # passes if `actual == expected`
  end
end
