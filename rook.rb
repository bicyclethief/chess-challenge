require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Rook < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board)
    forward_array = []
    backward_array = []
    left_array = []
    right_array = []
    while times <= 7
      forward_array << (square_object.dup.add_row(1)) # forward 1 more square
      right_array << (square_object.dup.add_column(1)) # right 1 more square
      backward_array << (square_object.dup.add_row(-1)) # backward 1 square
      left_array << (square_object.dup.add_column(-1)) # left 1 square
      times += 1
    end

    forward_array = legal_moves_delete(forward_array, board)
    backward_array = legal_moves_delete(backward_array, board)
    left_array = legal_moves_delete(left_array, board)
    right_array = legal_moves_delete(right_array, board)

    array_of_squares << forward_array + backward_array + left_array + right_array
  end

  # helper for legal_moves
  def legal_moves_delete(direction_array, board, direction)

    content = board.get_square_content(square)

    direction_array.each_with_index do |square|
      if board.out_of_bounds?(square) || (content != nil && !self.opponent?(content))
        array_of_squares.delete(square) # delete it if: out of bounds or it's occupied and the same color as my Rook
      end
      # Now delete everything AFTER this square from the direction_array.
      direction_array = direction_array.slice!((index+1)..-1)
    end
    direction_array
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♖" : "♜"
  end
end
