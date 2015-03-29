require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Pawn < Piece

  def legal_moves(square_object, board)
    array_of_squares_w = []
    array_of_squares_b = []
    legal_moves_white = []
    legal_moves_black = []
    if self.color == COLOR_WHITE
      legal_moves_white << square_object.dup.add_row(1)
      legal_moves_white << square_object.dup.add_row(2) if !(moved?)
      square_diag_right = square_object.dup.add_row(1).add_column(1) if square_object.dup.add_row(1) != nil
      if board.get_square_content(square_diag_right) != nil && square_diag_right.color == COLOR_BLACK
        legal_moves_white << square_diag_right
      end
      square_diag_left = square_object.dup.add_row(1).add_column(-1) if square_object.dup.add_row(1) != nil
      if board.get_square_content(square_diag_left) != nil && square_diag.color == COLOR_BLACK
        legal_moves_white << square_diag_left
      end
    else
      legal_moves_black << square_object.dup.add_row(-1)
      legal_moves_black << square_object.dup.add_row(-2) if !(moved?)
      square_diag_right = square_object.dup.add_row(-1).add_column(-1) if square_object.dup.add_row(-1) != nil
      if board.get_square_content(square_diag_right) != nil && square_diag_right.color == COLOR_BLACK
        legal_moves_black << square_diag_right
      end
      square_diag_left = square_object.dup.add_row(-1).add_column(1) if square_object.dup.add_row(-1) != nil
      if board.get_square_content(square_diag_left) != nil && square_diag.color == COLOR_BLACK
        legal_moves_black << square_diag_left
      end
    end

    legal_moves_white = legal_moves_delete(legal_moves_white, board)
    legal_moves_black = legal_moves_delete(legal_moves_black, board)
    array_of_squares_w << legal_moves_white
    array_of_squares_b << legal_moves_black
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
