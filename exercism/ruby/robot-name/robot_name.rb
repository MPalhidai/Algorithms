class Robot
  def name
    return @name if @name
    used = true
    while used
      @name = ''
      2.times{ @name += (65 + rand(26)).chr }
      3.times{ @name += rand(9).to_s }
      if @@names[@name].nil?
        @@names[@name] = used
        used = false
      end
    end
    @name
  end

  def reset
    @name = nil
    name
  end

  def self.forget
    @@names = {}
  end
end
