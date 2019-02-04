class BeerSong
  def self.recite(start, ammount)
    output = []
    finish = start - ammount
    while start > finish
      if start == 0
        verse = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
        output << verse
        break
      elsif start > 0
        bottles = start != 1 ? 'bottles' : 'bottle'
        one = start >= 2 ? 'one' : 'it'
        verse = "#{start} #{bottles} of beer on the wall, #{start} #{bottles} of beer.\nTake #{one} down and pass it around, "
        start -= 1
        bottles = start != 1 ? 'bottles' : 'bottle'
        verse += "#{start > 0 ? start : 'no more'} #{bottles} of beer on the wall.\n"
        output << verse
      end
    end
    output.join("\n")
  end
end
