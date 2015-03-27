require_relative 'board'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Knight < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board)


  end

  # helper for legal_moves
  def legal_moves_delete(array_of_squares, board, direction)

    content = board.get_square_content(square)

    array_of_squares.each do |square|
      if board.out_of_bounds?(square) || (content != nil && !self.opponent?(content))
        array_of_squares.delete(square) # delete it if: out of bounds or it's occupied and the same color as my Rook
      end
    end
    array_of_squares
  end

  def to_s
    (color == Piece::COLOR_WHITE) ? "♘" : "♞"
  end
end
