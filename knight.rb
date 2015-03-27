require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Knight < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board)
    array_of_squares << (square_object.dup.add_row(2).add_column(-1))                    # up 2, left 1
    array_of_squares << (square_object.dup.add_row(2).add_column(1))                     # up 2, right 1
    array_of_squares << (square_object.dup.add_column(2).add_row(1))                     # right 2, up 1
    array_of_squares << (square_object.dup.add_column(2).add_row(-1))                    # right 2, down 1
    array_of_squares << (square_object.dup.add_row(-2).add_column(1))                    # down 2, right 1
    array_of_squares << (square_object.dup.add_row(-2).add_column(-1))                   # down 2, left 1
    array_of_squares << (square_object.dup.add_column(-2).add_row(1))                    # left 2, up 1
    array_of_squares << (square_object.dup.add_column(-2).add_row(-1))                   # left 2, down 1
    legal_moves_delete(array_of_squares, board)
    array_of_squares
  end

  # helper for legal_moves
  def legal_moves_delete(array_of_squares, board)
    array_of_squares.each do |square|
      content = board.get_square_content(square)
      if board.out_of_bounds?(square) || (content != nil && !self.opponent?(content))
        array_of_squares.delete(square) # delete it if: out of bounds or it's occupied and the same color as my Knight
      end
    end
    array_of_squares
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♘" : "♞"
  end
end
