require_relative 'piece'

class King < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board)
    all = []
    all << (square_object.dup.add_row(1)) # forward 1 square
    all << (square_object.dup.add_row(-1)) # backward 1 square
    # below is the code if Square doesn't handle its own columns
    # my_coordinate = to_grid_notation(square_object)
    # all << to_chess_notation(my_coordinate.column += 1) # right 1 square
    # all << to_chess_notation(my_coordinate.column -= 1) # left 1 square
    all << (square_object.dup.add_column(1)) # right 1 square
    all << (square_object.dup.add_column(-1)) # left 1 square

    array_of_squares = legal_moves_delete(all, board)
  end

  # helper for legal_moves
  def legal_moves_delete(array_of_squares, board)
    array_of_squares.each do |square|
      content = board.get_square_content(square)
      if content != nil                       # if it's not empty
        if content.color == self.color        # if it's the same color as my King
          array_of_squares.delete(square)
        end
      end
    end
    array_of_squares
  end

  def to_s
    if color == Piece::COLOR_WHITE
      "♔"
    else
      "♚"
    end
  end

end

