require_relative 'board'
require_relative 'coordinate'
require_relative 'notation'
require_relative 'game'
require_relative 'king'
require_relative 'rook'
require_relative 'square'
require_relative 'bishop'

# Piece is an abstract superclass for specific Piece classes such as Pawn, Rook, etc.
class Piece

  include Notation

  attr_reader :color

  def initialize(color)
    @color = color
    @moved = false
  end

  def legal_moves(square_object, board_object)
    array_of_squares = []
    array_of_squares
  end

  def moved?
    @moved
  end

  def set_moved
    @moved = true
  end

  def to_s
  end

end
