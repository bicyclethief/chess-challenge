require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Bishop < Piece

  def legal_moves(square_object, board)
    left_up_array = []
    left_down_array = []
    right_up_array = []
    right_down_array = []
    counter = 1
    while counter <= 7
      diag_square_up = square_object.dup
      diag_square_up.add_row(counter)
      diag_square_down = square_object.dup
      diag_square_down.add_row(-counter)
      left_up_array << (diag_square_up.add_column(counter))
      left_down_array<< (diag_square_down.add_column(counter))
      right_up_array << (diag_square_up.add_column(-counter))
      right_down_array << (diag_square_down.add_column(-counter))
      counter += 1
    end
    left_up_array = legal_moves_delete(left_up_array, board) # inherits legal_moves_delete from Piece
    left_down_array = legal_moves_delete(left_down_array, board)
    right_up_array = legal_moves_delete(right_up_array, board)
    right_down_array = legal_moves_delete(right_down_array, board)

    array_of_squares << left_up_array + left_down_array + right_down_array + right_up_array
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♗" : "♝"
  end
end
