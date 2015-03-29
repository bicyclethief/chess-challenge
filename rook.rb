require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Rook < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board)
    cross_checker(square_object, board, 7)
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♖" : "♜"
  end
end
