class House
  @@verses = {
    intro: "This is the ",
    verbs: {
      "horse":"",
      "farmer":"that belonged to the ",
      "rooster":"that kept the ",
      "priest":"that woke the ",
      "man":"that married the ",
      "maiden":"that kissed the ",
      "cow":"that milked the ",
      "dog":"that tossed the ",
      "cat":"that worried the ",
      "rat":"that killed the ",
      "malt":"that ate the ",
      "house":"that lay in the "
    },
    adjectives: {
      "horse":" and the hound and the horn",
      "farmer":" sowing his corn",
      "rooster":" that crowed in the morn",
      "priest":" all shaven and shorn",
      "man":" all tattered and torn",
      "maiden":" all forlorn",
      "cow":" with the crumpled horn",
      "dog":"",
      "cat":"",
      "rat":"",
      "malt":"",
      "house":" that Jack built."
    }
  }

  def self.recite
    output = []
    n = @@verses[:verbs].keys.length
    nouns = @@verses[:verbs].keys.reverse
    nouns.each_index do |index|
      verse = []
      nouns[0..index].reverse.each_with_index do |noun, i|
        line = ''
        if i == 0
          line += @@verses[:intro]
        else
          line += @@verses[:verbs][noun]
        end
        line += noun.to_s + @@verses[:adjectives][noun]
        verse << line
      end
      output << verse.join("\n")
    end
    output.join("\n\n") + "\n"
  end

end
