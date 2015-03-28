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
    counter = 1
    while counter <= 7
      forward_array << (square_object.dup.add_row(counter)) # forward 1 more square
      right_array << (square_object.dup.add_column(counter)) # right 1 more square
      backward_array << (square_object.dup.add_row(-counter)) # backward 1 square
      left_array << (square_object.dup.add_column(-counter)) # left 1 square
      counter += 1
    end

    forward_array = legal_moves_delete(forward_array, board)
    backward_array = legal_moves_delete(backward_array, board)
    left_array = legal_moves_delete(left_array, board)
    right_array = legal_moves_delete(right_array, board)

    array_of_squares = forward_array + backward_array + left_array + right_array
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♖" : "♜"
  end
end
