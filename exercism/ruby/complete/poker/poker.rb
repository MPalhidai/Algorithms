class Poker
  @@faces = {
    J: 11,
    Q: 12,
    K: 13,
    A: 14
  }

  def initialize(hands) #hands should be [[hand],[hand],[hand]]
    @hands = hands
  end

  def best_hand
    return @hands if @hands.length < 2
    score_hands
    @scores.sort_by!{ |a,b,c| -a }
    @scores.map!{ |a| a if a[0] == @scores[0][0] }.compact!
    return [@hands[@scores[0][-1]]] if @scores.length < 2
    @scores.sort_by!{ |a,b,c| -b }

    @scores.map!{ |b| b if b[1] == @scores[0][1] }.compact!
    if @scores.length < 2
      [@hands[@scores[0][-1]]]
    else
      @scores.map{ |a,b,c| @hands[c] }
    end
  end

  private

  def score_hands
    @scores = []
    @hands.each_with_index do |hand, index|
      values = []
      suites = []
      hand.each do |card|
        convert = card[0...-1]
        @@faces[convert.to_sym] ? values << @@faces[convert.to_sym] : values << convert.to_i
        suites << card[-1]
      end

      if straight_flush(values, suites)
        @scores << [9, straight_flush(values, suites), index]
      elsif four_of_a_kind(values, suites)
        @scores << [8, four_of_a_kind(values, suites), index]
      elsif full_house(values, suites)
        @scores << [7, full_house(values, suites), index]
      elsif flush(values, suites)
        @scores << [6, flush(values, suites), index]
      elsif straight(values, suites)
        @scores << [5, straight(values, suites), index]
      elsif three_of_a_kind(values, suites)
        @scores << [4, three_of_a_kind(values, suites), index]
      elsif two_pair(values, suites)
        @scores << [3, two_pair(values, suites), index]
      elsif one_pair(values, suites)
        @scores << [2, one_pair(values, suites), index]
      elsif high_card(values, suites)
        @scores << [1, high_card(values, suites), index]
      end
    end
  end

  def straight_flush(values, suites)
    return false if suites.uniq.length != 1
    output = true
    array = values.sort
    if array[-1] == 14 && array[0] == 2
      array.pop
      array.unshift(1)
    end
    highest_card = array[-1]
    for i in 1...array.length
      output = false if array[i] != array[i-1] + 1
    end
    output ? highest_card : false
  end

  def four_of_a_kind(values, suites)
    return false if values.uniq.length != 2 && suites.uniq.length != 4
    hash = Hash.new(0)
    values.each do |card|
      hash[card] += 1
      return card if hash[card] == 4
    end
    false
  end

  def full_house(values, suites) # rank triplet / pair can't work if single deck
    return false if values.uniq.length != 2
    hash = Hash.new(0)
    house = 0
    pair = 0
    values.each do |card|
      hash[card] += 1
      house = card if hash[card] == 3
    end
    pair = values.map{|card| card != house}.uniq
    hash[house] == 3 && hash[pair] == 2 ? house : false
  end

  def flush(values, suites)
    suites.uniq.length == 1 ? values.max : false
  end

  def straight(values, suites)
    output = true
    array = values.sort
    if array[-1] == 14 && array[0] == 2
      array.pop
      array.unshift(1)
    end
    highest_card = array[-1]
    for i in 1...array.length
      output = false if array[i] != array[i-1] + 1
    end
    output ? highest_card : false
  end

  def three_of_a_kind(values, suites)
    hash = Hash.new(0)
    triplet = nil
    values.each do |card|
      hash[card] += 1
      triplet = card if hash[card] == 3
    end
    triplet.nil? ? false : triplet
  end

  def two_pair(values, suites)
    hash = Hash.new(0)
    pairs = []
    values.each do |card|
      hash[card] += 1
      pairs << card if hash[card] == 2
    end
    pairs.length == 2 ? pairs.max : false
  end

  def one_pair(values, suites)
    hash = Hash.new(0)
    pair = nil
    values.each do |card|
      hash[card] += 1
      pair = card if hash[card] == 2
    end
    pair.nil? ? false : pair
  end

  def high_card(values, suites)
    values.max
  end
end
