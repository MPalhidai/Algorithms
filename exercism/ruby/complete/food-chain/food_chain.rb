class FoodChain
  @@foodchain = {
    fly: nil,
    spider: 'wriggled and jiggled and tickled inside her.', # took off It
    bird: 'How absurd to swallow a bird!',
    cat: 'Imagine that, to swallow a cat!',
    dog: 'What a hog, to swallow a dog!',
    goat: 'Just opened her throat and swallowed a goat!',
    cow: 'I don\'t know how she swallowed a cow!',
    horse: nil
  }
  @@lines = {
    intro: 'I know an old lady who swallowed a ',
    chorus1: 'She swallowed the',
    chorus2: 'to catch the',
    end_stanza: 'I don\'t know why she swallowed the fly. Perhaps she\'ll die.',
    end_song: 'She\'s dead, of course!'
  }
  def self.song
    output = []
    animals = @@foodchain.keys
    animals.each_with_index do |animal, index|
      stanza = []
      stanza << @@lines[:intro] + animal.to_s + "."

      line = ''
      line += 'It ' if index == 1
      line += "#{@@foodchain[animal]}"
      stanza << line unless index == 0 || index == animals.length - 1

      i = index
      while i > 0 && index != animals.length - 1
        chorus_line = "#{@@lines[:chorus1]} #{animals[i]} #{@@lines[:chorus2]} #{animals[i-1]}"
        i - 1 == 1 ? chorus_line += " that #{@@foodchain[animals[i-1]]}" : chorus_line += "."
        stanza << chorus_line
        i -= 1
      end

      index == animals.length - 1 ? stanza << @@lines[:end_song] : stanza << @@lines[:end_stanza]

      output << stanza.join("\n")
    end
    output.join("\n\n") + "\n"
  end
end
