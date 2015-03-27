require 'byebug'
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
    times = 0
    while times <= 7
      diag_square_up = square_object.dup
      diag_square_up.add_row(1)
      diag_square_down = square_object.dup
      diag_square_down.add_row(-1)
      left_up_array << (diag_square_up.add_column(1))
      left_down_array<< (diag_square_down.add_column(1))
      right_up_array << (diag_square_up.add_column(-1))
      right_down_array << (diag_square_down.add_column(-1))
      times += 1
    end
    left_up_array = legal_moves_delete(left_up_array, board)
    left_down_array = legal_moves_delete(left_down_array, board)
    right_up_array = legal_moves_delete(right_up_array, board)
    right_down_array = legal_moves_delete(right_down_array, board)

    array_of_squares << left_up_array + left_down_array + right_down_array + right_up_array
  end

  # helper for legal_moves
  def legal_moves_delete(direction_array, board)

        byebug

    direction_array.each_with_index do |square, index|
      content = board.get_square_content(square)

      if board.out_of_bounds?(square) || (content != nil && content.color == self.color)
        array_of_squares.delete(square)
      end
      direction_array = direction_array.slice!((index+1)..-1)
    end
    direction_array
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♗" : "♝"
  end
end
