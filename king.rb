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
    nil_checker1 = square_object.dup.add_row(1)
    nil_checker2 = square_object.dup.add_row(-1)

    all << (square_object.dup.add_row(1).add_column(1)) if nil_checker1.row != nil
    all << (square_object.dup.add_row(-1).add_column(-1)) if nil_checker2.row != nil
    all << (square_object.dup.add_row(-1).add_column(1)) if nil_checker2.row != nil
    all << (square_object.dup.add_row(1).add_column(-1)) if nil_checker1.row != nil

    array_of_squares = legal_moves_delete(all, board)

    avoid_checkmate(array_of_squares, board)
  end

  def avoid_checkmate(array_of_squares, board)
    # check every square on the board for enemy pieces
    # if enemy piece, check its legal squares.
    # remove any of the enemy's legal squares from my king's array_of_squares.

  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♔" : "♚"
  end

end

