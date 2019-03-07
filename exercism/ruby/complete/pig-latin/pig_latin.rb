class PigLatin
  @@vowels = ['a','e','i','o','u']
  @@special_cases = ['x','y']

  def self.translate(string)
    array = string.split(' ')
    for i in 0...array.length
      j = 0
      if @@vowels.include?(array[i][0]) || (@@special_cases.include?(array[i][0]) && !@@vowels.include?(array[i][1]))
        array[i] = array[i] + 'ay'
        break
      else
        n = array[i].length
        while j < n && !@@vowels.include?(array[i][j])
          j += 1
          break if j > 0 && @@special_cases.include?(array[i][j])
          j += 1 if array[i][j-1] == 'q' && array[i][j] == 'u'
        end
        array[i] = array[i][j...n] + array[i][0...j] + 'ay'
      end
    end
    array.join(' ')
  end
end
