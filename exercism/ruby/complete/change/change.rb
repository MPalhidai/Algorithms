class Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  class << self
    def generate(coins, amount)
      raise NegativeTargetError, "Amount cannot be negative, #{amount} given." if amount.negative?

      new(coins).generate(amount) \
        or raise ImpossibleCombinationError, "No combination of coins #{coins} can amount to #{amount}."
    end
  end

  attr_reader :iterations

  def initialize(coins)
    @coins = coins
    @amounts = {}
  end

  def generate(amount)
    @amounts[amount] ||= generate_amount(amount)
  end

  private

  def generate_amount(amount)
    return [] if amount.zero?

    suitable_coins(amount)
      .map { |coin| generate_with_coin(amount, coin) }
      .compact
      .min_by(&:size)
  end

  def generate_with_coin(amount, coin)
    remainder = generate(amount - coin)

    remainder + [coin] if remainder
  end

  def suitable_coins(amount)
    @coins.select { |coin| coin <= amount }.sort.reverse
  end
end
