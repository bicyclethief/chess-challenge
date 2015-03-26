require_relative "notation.rb"

# Piece is an abstract superclass for specific Piece classes such as Pawn, Rook, etc.
class Piece

  include "Notation"

  attr_reader :color

  def initialize(color)
    @color = color
    @moved = false
  end

  # legal_moves(Square, Board): returns Array of Squares of legal moves
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

  private

  # returns Array of possible Squares given the Piece's move pattern
  def all_moves(square_object)
    array_of_squares = []
    array_of_squares
  end

end
