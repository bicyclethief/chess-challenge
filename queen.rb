require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Queen < Piece

  def legal_moves(square_object, board)
    up = []
    down = []
    left = []
    right = []
    diag_up_left = []
    diag_up_right = []
    diag_down_right = []
    diag_down_left = []
    times = 0
    while times <= 7
      up << (square_object.dup.add_row(1))
      down << (square_object.dup.add_row(-1))
      right << (square_object.dup.add_column(1))
      left << (square_object.dup.add_column(-1))

      diag_up_right << (square_object.dup.add_row(1).add_column(1))
      diag_down_left << (square_object.dup.add_row(-1).add_column(-1))
      diag_down_right << (square_object.dup.add_row(-1).add_column(1))
      diag_up_left << (square_object.dup.add_row(1).add_column(-1))
      times += 1
    end

    up = legal_moves_delete(up, board)
    down = legal_moves_delete(down, board)
    left = legal_moves_delete(left, board)
    right = legal_moves_delete(right, board)
    diag_up_left = legal_moves_delete(diag_up_left, board)
    diag_up_right = legal_moves_delete(diag_up_right, board)
    diag_down_right = legal_moves_delete(diag_down_right, board)
    diag_down_left = legal_moves_delete(diag_down_left, board)

    array_of_squares << up + down + left + right + diag_down_left + diag_down_right + diag_up_left + diag_up_right
  end


  def legal_moves_delete(array_of_squares, board)
    array_of_squares.each do |square|
      content = board.get_square_content(square)
      if board.out_of_bounds?(square) || (content != nil && !self.opponent?(content))
        array_of_squares.delete(square)
      end
    end
    array_of_squares
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♕" : "♛"
  end

end
