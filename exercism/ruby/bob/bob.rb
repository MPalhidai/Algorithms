class Bob
  @@acronyms = { OK: true, DMV: true }

  def self.hey(string)
    string.strip!
    if string == ''
      "Fine. Be that way!"
    elsif loud?(string) && string[-1] != '?'
      "Whoa, chill out!"
    elsif loud?(string) && string[-1] == '?'
      "Calm down, I know what I'm doing!"
    elsif string[-1] == '?'
      "Sure."
    else
      "Whatever."
    end
  end

  private

  def self.loud?(string)
    string.gsub(/\W/, ' ').split.any? do |word|
      unless @@acronyms[word.to_sym] == true || word.length < 2
        word.chars.all?{ |letter| /[A-Z]/.match(letter) }
      end
    end
  end
end
