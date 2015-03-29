require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'
require_relative 'notation'

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
    calculations = [[1, 1], [-1, -1], [-1, 1], [1, -1]]
    calculations.each do |calculation|
      square = square_object.dup
      if !board.out_of_bounds?(square.add_row(calculation[0])) &&
         !board.out_of_bounds?(square.add_column(calculation[1]))
         all << square
      end
    end

    array_of_squares = delete_friend_occupied_squares(all, board)
    array_of_squares = delete_bad_squares(array_of_squares, board)

    avoid_checkmate(self, array_of_squares, board)
  end

  # TROUBLESHOOT THIS METHOD
  def avoid_checkmate(king, array_of_squares, board)
    return_array = array_of_squares.dup
    to_delete = []
    # check every square on the board for enemy pieces.
    # if enemy piece, check its legal squares.
    # remove any of the enemy's legal squares from my king's array_of_squares.
    board.each_square_with_location do |piece, square|
      if piece != nil && piece.color != king.color
        # Running line 45 throws a "stack level too deep error. Why?"
        # to_delete << piece.legal_moves(square, board)
      end
    end
    return_array - to_delete
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♔" : "♚"
  end

end

