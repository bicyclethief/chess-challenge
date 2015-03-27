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
  LETTERS = ('a'..'h').to_a.reverse

  def to_chess_notation(coordinate)
    Square.new(coordinate.row + 1, LETTERS[coordinate.column])
  end

  def to_grid_notation(square)
    Coordinate.new(LETTER_INDEX[square.column], square.row - 1, )
  end
end