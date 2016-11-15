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
end
