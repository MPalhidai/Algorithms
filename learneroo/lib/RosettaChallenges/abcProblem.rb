# can a word be made from the card sample. only one side a card can be used.

def abc(word)
  sample = [['B', 'O'],['X', 'K'],['D', 'Q'],['C', 'P'],['N', 'A'],['G', 'T'],['R', 'E'],['T', 'G'],['Q', 'D'],['F', 'S'],['J', 'W'],['H', 'U'],['V', 'I'],['A', 'N'],['O', 'B'],['E', 'R'],['F', 'S'],['L', 'Y'],['P', 'C'],['Z', 'M']]

  cards = sample.flatten

  word.chars.each do |letter|
    idx = cards.index(letter)
    return false unless idx
    if idx.even?
      cards.delete_at(idx)
      cards.delete_at(idx)
    elsif idx.odd?
      cards.delete_at(idx-1)
      cards.delete_at(idx-1)
    end
  end
  true
end

tests = ['A', 'BBB', 'BARK', 'BOOK', 'TREAT', 'COMMON', 'SQUAD', 'CONFUSE']
tests.each do |try|
  puts abc(try)
end
