require_relative 'coordinate'
require_relative 'square'

class Notation

  LETTER_INDEX = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7 }
  LETTERS = ('a'..'h').to_a

  RANK_TO_INDEX = { 8 => 0, 7 => 1, 6 => 2, 5 => 3, 4 => 4, 3 => 5, 2 => 6, 1 => 7 }
  INDEX_TO_RANK = [8, 7, 6, 5, 4, 3, 2, 1]

  def self.to_chess_notation(coordinate)
    return Square.new if coordinate.column < 0 || coordinate.column > (LETTERS.length-1)
    return Square.new if coordinate.row < 0 || coordinate.row > (INDEX_TO_RANK.length-1)
    Square.new(LETTERS[coordinate.column], INDEX_TO_RANK[coordinate.row])
  end

  def self.to_grid_notation(square)
    Coordinate.new(RANK_TO_INDEX[square.row], LETTER_INDEX[square.column])
  end
end

