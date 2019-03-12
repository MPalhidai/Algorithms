class Allergies
  attr_reader :list

  @@allergens = {
    eggs: 1,
    peanuts: 2,
    shellfish: 4,
    strawberries: 8,
    tomatoes: 16,
    chocolate: 32,
    pollen: 64,
    cats: 128
  }

  def initialize(score)
    score %= 256
    @list = []
    @@allergens.keys.reverse.each do |allergen|
      if @@allergens[allergen] <= score
        @list << allergen.to_s
        score -= @@allergens[allergen]
      end
    end
  end

  def allergic_to?(food)
    @list.include?(food)
  end
end
