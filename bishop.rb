require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Bishop < Piece

  def legal_moves(square_object, board)
    diagonals_checker(square_object, board, 7)
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♗" : "♝"
  end
end
