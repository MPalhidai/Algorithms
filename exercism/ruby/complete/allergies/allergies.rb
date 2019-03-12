class Allergies
  attr_reader :list

  @@allergens = {
    cats: 128,
    pollen: 64,
    chocolate: 32,
    tomatoes: 16,
    strawberries: 8,
    shellfish: 4,
    peanuts: 2,
    eggs: 1
  }

  def initialize(score)
    score %= 256
    @list = []
    @@allergens.each do |allergen, value|
      if value <= score
        @list << allergen.to_s
        score -= value
      end
    end
  end

  def allergic_to?(food)
    @list.include?(food)
  end
end
