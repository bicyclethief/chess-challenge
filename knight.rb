require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Knight < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board)

    array_of_squares = []

    calculations = [[2, -1], [2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [1, -2], [-1, -2]]
    calculations.each do |calculation|
      square = square_object.dup
      if !board.out_of_bounds?(square.add_row(calculation[0])) && !board.out_of_bounds?(square.add_column(calculation[1]))
        array_of_squares << square
      end
    end

    legal_moves_delete(array_of_squares, board)
    array_of_squares
  end

  # helper for legal_moves, overwrites the version in Piece
  def legal_moves_delete(array_of_squares, board)

    array_of_squares = delete_bad_squares(array_of_squares, board)

    array_of_squares.delete_if do |square|
      content = board.get_square_content(square)
      content != nil && !self.opponent?(content)
    end

    array_of_squares
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♘" : "♞"
  end
end
