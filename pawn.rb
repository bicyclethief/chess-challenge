require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Pawn < Piece

  def legal_moves(square, board)
    moves = []

    if self.color == COLOR_WHITE
      forward = 1
      forward_2 = 2
      diags = [[1, 1], [1, -1]]
    else
      forward = -1
      forward_2 = -2
      diags = [[-1, -1], [-1, 1]]
    end

    forward_square = square.dup.add_row(forward)
    forward_content = board.get_square_content(forward_square)
    moves << forward_square if forward_content.nil?

    if !self.moved?
      forward_2_square = square.dup.add_row(forward_2)
      forward_2_content = board.get_square_content(forward_2_square)
      moves << forward_2_square if forward_2_content.nil?
    end

    diags.each do |calculation|
      diag_square = square.dup
      if !board.out_of_bounds?(diag_square.add_row(calculation[0])) &&
         !board.out_of_bounds?(diag_square.add_column(calculation[1]))
        diag_square = square.dup.add_row(calculation[0]).add_column(calculation[1])
        diag_square_content = board.get_square_content(diag_square)
        moves << diag_square if !diag_square_content.nil? && self.opponent?(diag_square_content)
      end
    end

    moves = delete_bad_squares(moves, board)
  end

  def to_s
    (self.color == Piece::COLOR_WHITE) ? "♙" : "♟"
  end
end
