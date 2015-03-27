require_relative 'board'
require_relative 'coordinate'
require_relative 'game'
require_relative 'king'
require_relative 'piece'
require_relative 'rook'
require_relative 'square'
require_relative 'bishop'

module Notation

  LETTER_INDEX = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7 }
  LETTERS = ('a'..'h').to_a

  RANK_TO_INDEX = { 8 => 0, 7 => 1, 6 => 2, 5 => 3, 4 => 4, 3 => 5, 2 => 6, 1 => 7 }
  INDEX_TO_RANK = [8, 7, 6, 5, 4, 3, 2, 1]


  def to_chess_notation(coordinate)
    Square.new(LETTERS[coordinate.column], INDEX_TO_RANK[coordinate.row])
  end

  def to_grid_notation(square)
    Coordinate.new(RANK_TO_INDEX[square.row], LETTER_INDEX[square.column])
  end
end