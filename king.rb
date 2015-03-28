require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class King < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board)
    all = []

    # 90 degrees
    all << (square_object.dup.add_row(1)) # forward 1 square
    all << (square_object.dup.add_row(-1)) # backward 1 square
    all << (square_object.dup.add_column(1)) # right 1 square
    all << (square_object.dup.add_column(-1)) # left 1 square
    # diagonals
    all << (square_object.dup.add_row(1).add_column(1))
    all << (square_object.dup.add_row(-1).add_column(-1))
    all << (square_object.dup.add_row(-1).add_column(1))
    all << (square_object.dup.add_row(1).add_column(-1))

    array_of_squares = legal_moves_delete(all, board)
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♔" : "♚"
  end

end

