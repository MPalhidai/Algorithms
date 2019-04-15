class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(real, imaginary)
    @real = real.to_f
    @imaginary = imaginary.to_f
  end

  def *(other)
    ComplexNumber.new(@real * other.real - @imaginary * other.imaginary, @imaginary * other.real + @real * other.imaginary)
  end

  def +(other)
    ComplexNumber.new(@real + other.real, @imaginary + other.imaginary)
  end

  def -(other)
    ComplexNumber.new(@real - other.real, @imaginary - other.imaginary)
  end

  def /(other)
    a = (@real * other.real + @imaginary * other.imaginary) / (other.real ** 2 + other.imaginary ** 2)
    b = (@imaginary * other.real - @real * other.imaginary) / (other.real ** 2 + other.imaginary ** 2)
    ComplexNumber.new(a, b)
  end

  def ==(other)
    @real == other.real && @imaginary == other.imaginary
  end

  def abs
    Math.sqrt(@real ** 2 + @imaginary ** 2)
  end

  def conjugate
    ComplexNumber.new(@real, -@imaginary)
  end

  def exp
    a = Math::E ** @real
    ComplexNumber.new(fix(a * Math.cos(@imaginary)), fix(a * Math.sin(@imaginary)))
  end

  private

  def fix(float)
     (float.round(1) - float).abs < 0.000000000000001 ? float.round(1) : float
  end
end
