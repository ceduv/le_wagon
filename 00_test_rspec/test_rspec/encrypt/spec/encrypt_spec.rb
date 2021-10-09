require_relative '../encrypt.rb' # back in folder

describe "#encrypt" do
  # should return an empty string with a empty text
  it 'should return an empty string with a empty text' do
    actual = encrypt("")  # method a test ( avec param a test )
    expected = ""         # ce qu on attend
    expect(actual).to eq(expected) # on compare actual et expected
  end
  # should return the right encrypted text
  it "returns the 3-letter backward-shifted text" do
    actual = encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG!!")
    expected = "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD!!"
    expect(actual).to eq(expected)
  end
end
