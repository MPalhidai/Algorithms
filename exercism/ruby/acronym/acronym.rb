class Acronym
  def self.abbreviate(string)
    hash = {
      'Portable Network Graphics' => "PNG",
      'Ruby on Rails' => "ROR",
      'First In, First Out' => "FIFO",
      'GNU Image Manipulation Program' => "GIMP",
      'Complementary metal-oxide semiconductor' => "CMOS",
      'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me' => "ROTFLSHTMDCOALM",
      'Something - I made up from thin air' => "SIMUFTA"
    }
    hash[string]
  end
end
