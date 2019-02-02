class Array
  def accumulate
    output = []
    for i in 0...self.length
      output[i] = yield(self[i])
    end
    output
  end
end
