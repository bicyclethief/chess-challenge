require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

#something with board. everything here

class Pawn < Piece

  def legal_moves(square_object, board)
    array_of_squares_w = []
    array_of_squares_b = []
    legal_moves_white = []
    legal_moves_black = []
    if self.color == COLOR_WHITE
      square_object_one = square_object.dup
      square_object_one.add_row(1)
      legal_moves_white << square_object_one
      if ! (moved?)
        square_jump_two = square_object.dup
        square_jump_two.add_row(2)
        legal_moves_white << square_jump_two
      end
      square_diag_right = square_object.dup
      square_diag_right.add_row(1)
      square_diag_right.add_column(1)
      if board.get_square_content(square_diag_right) != nil && square_diag_right.color == COLOR_BLACK
        legal_moves_white << square_diag_right
      end
      square_diag_left = square_object.dup
      square_diag_left.add_row(1)
      square_diag_left.add_column(-1)
      if board.get_square_content(square_diag_left) != nil  && square_diag.color == COLOR_BLACK
        legal_moves_white << square_diag_left
      end
      legal_moves_white
    else
      square_object_one = square_object.dup
      square_object_one.add_row(-1)
      legal_moves_black << square_object_one
      if ! (moved?)
        square_jump_two = square_object.dup
        square_jump_two.add_row(-2)
        legal_moves_black << square_jump_two
      end
      square_diag_right = square_object.dup
      square_diag_right.add_row(-1)
      square_diag_right.add_column(-1)
      if board.get_square_content(square_diag_right) != nil && square_diag_right.color == COLOR_BLACK
        legal_moves_black << square_diag_right
      end
      square_diag_left = square_object.dup
      square_diag_left.add_row(-1)
      square_diag_left.add_column(1)
      if board.get_square_content(square_diag_left) != nil  && square_diag.color == COLOR_BLACK
        legal_moves_black << square_diag_left
      end
      legal_moves_black
    end

    legal_moves_white = legal_moves_delete(legal_moves_white, board)
    legal_moves_black = legal_moves_delete(legal_moves_black, board)
    array_of_squares_w.push(legal_moves_white)
    array_of_squares_b.push(legal_moves_black)
    correct_arr_w = array_of_squares_w.flatten
    correct_arr_b = array_of_squares_b.flatten


    if self.color == COLOR_WHITE
      correct_arr_w
    else
      correct_arr_b
    end
  end

  def to_s
    (self.color == Piece::COLOR_WHITE) ? "♙" : "♟"
  end
end
