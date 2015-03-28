require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Bishop < Piece

  def legal_moves(square_object, board)
    diag1 = []
    diag2 = []
    diag3 = []
    diag4 = []
    counter = 1
    while counter <= 7
      nil_checker1 = square_object.dup.add_row(counter)
      nil_checker2 = square_object.dup.add_row(-counter)

      diag1 << (square_object.dup.add_row(counter).add_column(counter)) if nil_checker1.row != nil
      diag2 << (square_object.dup.add_row(-counter).add_column(-counter)) if nil_checker2.row != nil
      diag3 << (square_object.dup.add_row(-counter).add_column(counter)) if nil_checker2.row != nil
      diag4 << (square_object.dup.add_row(counter).add_column(-counter)) if nil_checker1.row != nil

      counter += 1
    end
    diag1 = legal_moves_delete(diag1, board)
    diag2 = legal_moves_delete(diag2, board)
    diag3 = legal_moves_delete(diag3, board)
    diag4 = legal_moves_delete(diag4, board)

    array_of_squares = diag1 + diag2 + diag3 + diag4
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♗" : "♝"
  end
end
