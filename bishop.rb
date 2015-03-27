require_relative 'board'
require_relative 'coordinate'
require_relative 'notation'
require_relative 'piece'
require_relative 'square'

class Bishop < Piece

  def legal_moves(square_object, board)
    legal_arr = []
    diagonal_up_right = []
    diagonal_up_left = []
    diagonal_down_right= []
    diagonal_down_left = []
    clone_obj = square_object.dup
    until ! (board.empty?(clone_obj)) || board.out_of_bounds(clone_obj)
      # need to add some sort of code to distinguish between empty squaure vs filled but which color
      clone_obj.add_row(1)
      clone_obj.add_column(1)
      diagonal_up_right << (clone_obj)
    end
    clone_obj_two = square_object.dup
    until ! (board.empty?(clone_obj_two)) || board.out_of_bounds(clone_obj_two)
      clone_obj_two.add_row(1)
      clone_obj_two.add_column(-1)
      diagonal_up_left << (clone_obj_two)
    end
    clone_obj_three = square_object.dup
    until ! (board.empty?(clone_obj_three)) || board.out_of_bounds(clone_obj_three)
      clone_obj_three.add_row(-1)
      clone_obj_three.add_column(1)
      diagonal_down_right << (clone_obj_three)
    end
    clone_obj_four = square_object.dup
    until ! (board.empty?(clone_obj_four)) || board.out_of_bounds(clone_obj_four)
      clone_obj_four.add_row(-1)
      clone_obj_four.add_column(-1)
      diagonal_down_left << (clone_obj_four.dup)
    end

    legal_arr <<  diagonal_up_right + diagonal_up_left + diagonal_down_right + diagonal_down_left
  end
end
