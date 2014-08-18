class Unhash
  attr_reader :letters, :seed

  def initialize(letters, seed)
    @letters = letters
    @seed = seed
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
    each_position do |pos|
      if index.zero? && first_hash?(hash, pos)
        add_position(pos)
        return true
      else
        return true if add_position_for_correct_hash(hash, index, pos, seed)
      end
    end

    false
  end

  def add_position_for_correct_hash(hash, index, position, seed)
    return false unless correct_hash?(hash, position, index, seed)

    add_position(position)
    position
  end

  def correct_hash?(hash, position, index, seed)
    previous_hash = calc_hash(hash, position)

    previous_hash.to_i == previous_hash &&
      _unhash(previous_hash, index - 1, seed)
  end

  def add_position(position)
    @value << @letters[position]
  end

  def first_hash?(hash, position)
    @seed.to_f == calc_hash(hash, position)
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
