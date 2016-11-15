require('rspec')
require('numbers_to_words')

describe('Fixnum#numbers_to_words') do
  it('Will tranlate a single digit number to a word') do
    expect(4.numbers_to_words()).to(eq("four"))
  end

  it("Will translate a non teen two digit number to a word") do
    expect(24.numbers_to_words()).to(eq("twenty four"))
  end

  it("Will translate a teen two digit number to a word") do
    expect(14.numbers_to_words()).to(eq("fourteen"))
  end

  it("Will translate a three digit number to a word") do
    expect(145.numbers_to_words()).to(eq("one hundred forty five"))
  end

  it("Will translate a four digit number to a word") do
    expect(2145.numbers_to_words()).to(eq("two thousand one hundred forty five"))
  end

  it("Will translate a five digit number to a word") do
    expect(32145.numbers_to_words()).to(eq("thirty two thousand one hundred forty five"))
  end

  it("Will translate a six digit number to a word") do
    expect(932145.numbers_to_words()).to(eq("nine hundred thirty two thousand one hundred forty five"))
  end

  it("will translate a seven digit number into words") do
    expect(4234424.numbers_to_words()).to(eq('four million two hundred thirty four thousand four hundred twenty four'))
  end

  it("Will translate a eight digit number into words") do
    expect(54032504.numbers_to_words()).to(eq('fifty four million thirty two thousand five hundred four'))
  end

  it("Will translate a nine digit number into words") do
    expect(532953842.numbers_to_words()).to(eq('five hundred thirty two million nine hundred fifty three thousand eight hundred forty two'))
  end

  it("Will translate a ten digit number into words") do
    expect(3532953842.numbers_to_words()).to(eq('three billion five hundred thirty two million nine hundred fifty three thousand eight hundred forty two'))
  end

  it("Will translate an eleven digit number into words") do
    expect(93532953842.numbers_to_words()).to(eq('ninety three billion five hundred thirty two million nine hundred fifty three thousand eight hundred forty two'))
  end

  it("Will translate an twelve digit number into words") do
    expect(293532953842.numbers_to_words()).to(eq('two hundred ninety three billion five hundred thirty two million nine hundred fifty three thousand eight hundred forty two'))
  end

end
