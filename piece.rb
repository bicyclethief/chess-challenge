require_relative 'square'
require_relative 'board'
require_relative 'coordinate'

# Piece is an abstract superclass for specific Piece classes such as Pawn, Rook, etc.
class Piece

  COLOR_WHITE = 1
  COLOR_BLACK = 0

  attr_reader :color

  def initialize(color)
    @color = color
    @moved = false
  end

  def legal_moves(square_object, board_object)
    array_of_squares = []
    array_of_squares
  end

  # helper for legal_moves: implemented by Rook, Bishop, Queen, King.
  # Knight overwrites it.
  def legal_moves_delete(direction_array, board)

    direction_array.each_with_index do |square, index|
      content = board.get_square_content(square)
      if board.out_of_bounds?(square)
        direction_array.delete(square)
      elsif (content != nil && !self.opponent?(content)) # if it's occupied and the same color as my Piece, delete THIS square AND everything after it from the direction_array.
        direction_array = direction_array.slice!(0...index)
      elsif (content != nil && self.opponent?(content)) # if an opponent is in the square, delete ONLY everything AFTER this square from the direction_array.
        direction_array = direction_array.slice!(0...index+1)
      end
    end
    direction_array
  end

  def moved?
    @moved
  end

  def set_moved
    @moved = true
  end

  def opponent?(piece)
    self.color != piece.color
  end

  def to_s
  end

  def name
    self.class.to_s.downcase
  end
end

