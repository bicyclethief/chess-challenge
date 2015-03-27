require_relative 'board'
require_relative 'coordinate'
require_relative 'notation'
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

  # helper for legal_moves
  def legal_moves_delete(array_of_squares, board)
    array_of_squares.each do |square|
      content = board.get_square_content(square)
      if content != nil                       # if it's not empty
        if content.color == self.color        # if it's the same color as my King
          array_of_squares.delete(square)
        end
      end
    end
    array_of_squares
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♔" : "♚"
  end

end

