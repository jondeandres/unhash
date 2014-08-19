class Unhash
  attr_reader :letters, :seed

  def initialize(letters)
    @letters = letters
    @seed = 7
    @value = []
  end

  def unhash!(hash, length)
    _unhash(hash, length - 1, @seed)
  end

  def value
    @value.join
  end

  private

  def _unhash(hash, index, seed)
    res = each_position do |pos|
      next unless correct_hash?(hash, pos, index, seed)

      add_position(pos)
      break true
    end || false

    res
  end

  def correct_hash?(hash, position, index, seed)
    previous_hash = calc_hash(hash, position)

    return true if index.zero? && @seed.to_f == previous_hash
    return false if index.zero?

    previous_hash.to_i == previous_hash &&
      _unhash(previous_hash, index - 1, seed)
  end

  def add_position(position)
    @value << @letters[position]
  end

  def calc_hash(hash, position)
    (hash - position) / 37.to_f
  end

  def each_position
    @letters.size.times do |i|
      yield (i)
    end
  end
end
