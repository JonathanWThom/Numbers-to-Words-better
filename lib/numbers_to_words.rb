class Fixnum
  define_method(:numbers_to_words) do
    digits = self.to_s.size

    individuals = {
      0 => "",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
    }

    deca = {
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety",
      0 => "",
    }

    hundreds = {
        1 => "one hundred",
        2 => "two hundred",
        3 => "three hundred",
        4 => "four hundred",
        5 => "five hundred",
        6 => "six hundred",
        7 => "seven hundred",
        8 => "eight hundred",
        9 => "nine hundred",
        0 => ""
    }

    string_number = self.to_s
    numbers = string_number.split("")
    hundreds_array = numbers.pop(3)
    thousands_array = numbers.pop(3)
    thousands_number = thousands_array.join("").to_i
    millions_array = numbers.pop(3)
    billions_array = numbers.pop(3)

    last_two = hundreds_array.last(2)
    final_words = []
    hundred = ""
    thousand = ""
    if hundreds_array.size.eql?(1)
      hundreds = individuals.fetch(self)
    elsif hundreds_array.size.eql?(2) && self.<(20)
      hundreds = individuals.fetch(self)
    elsif hundreds_array.size.eql?(2)
      tens_word = deca.fetch(hundreds_array[0].to_i)
      singles_word = individuals.fetch(hundreds_array[1].to_i)
      words = tens_word.concat(" " + singles_word)
      hundreds = words.strip
    elsif hundreds_array.size.eql?(3) && last_two.join("").to_i.<(20)
      hundreds_word = hundreds.fetch(hundreds_array[0].to_i)
      teens_word = individuals.fetch(last_two.join("").to_i)
      words = hundreds_word.concat(" " + teens_word)
      hundreds = words.strip
    elsif hundreds_array.size.eql?(3)
      singles_word = individuals.fetch(hundreds_array[2].to_i)
      tens_word = deca.fetch(hundreds_array[1].to_i)
      hundreds_word = hundreds.fetch(hundreds_array[0].to_i)
      words = hundreds_word.concat(" " +tens_word+ " "+singles_word)
      hundreds = words.strip
    end

    if thousands_array.size.eql?(1)
      thousands = individuals.fetch(thousands_number) + " thousand"
    elsif thousands_array.size.eql?(2) && thousands_number.<(20)
      thousands = individuals.fetch(thousands_number) + " thousand"
    elsif thousands_array.size.eql?(2)
      tens_word = deca.fetch(thousands_array[0].to_i)
      singles_word = individuals.fetch(thousands_array[1].to_i)
      words = tens_word.concat(" " + singles_word)
      thousands = words.strip + " thousand"
    elsif thousands_array.size.eql?(3) && last_two.join("").to_i.<(20)
      hundreds_word = hundreds.fetch(thousands_array[0].to_i)
      teens_word = individuals.fetch(last_two.join("").to_i)
      words = hundreds_word.concat(" " + teens_word)
      thousands = words.strip + " thousand"
    elsif thousands_array.size.eql?(3)
      singles_word = individuals.fetch(thousands_array[2].to_i)
      tens_word = deca.fetch(thousands_array[1].to_i)
      hundreds_word = hundreds.fetch(thousands_array[0].to_i)
      words = hundreds_word.concat(" " +tens_word+ " "+singles_word)
      thousands = words.strip + " thousand"
    end

    final_words.push(thousands)
    final_words.push(hundreds)
    final_words.join(" ").strip
  end
end
