class King < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board_object)
    array_of_squares = []



    array_of_squares
  end

  def to_s
  end

  private

  # returns Array of all possible Squares given the Piece's move pattern
  def all_moves(square_object)
    moves = []

    moves << (square_object.row += 1) # forward 1 square
    moves << (square_object.row -= 1) # backward 1 square

    my_coordinate = to_grid_notation(square_object) #

    moves << to_chess_notation(my_coordinate.column += 1) # right 1 square
    moves << to_chess_notation(my_coordinate.column -= 1) # left 1 square

    moves
  end



end
