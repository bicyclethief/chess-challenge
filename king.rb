class King < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board)
    array_of_squares = all_moves(square_object)
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

  end

  private

  # returns Array of all possible Squares given the Piece's move pattern
  def all_moves(square_object)
    all = []

    all << (square_object.dup.add_row(1)) # forward 1 square
    all << (square_object.dup.add_row(-1)) # backward 1 square

    # this is the code for lines 35-36 if Square doesn't handle its own columns
    # my_coordinate = to_grid_notation(square_object)
    # all << to_chess_notation(my_coordinate.column += 1) # right 1 square
    # all << to_chess_notation(my_coordinate.column -= 1) # left 1 square

    all << (square_object.dup.add_column(1)) # right 1 square
    all << (square_object.dup.add_column(-1)) # left 1 square

    all
  end

end
