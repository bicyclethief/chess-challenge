class Rook < Piece

  # returns Array of Squares of legal moves
  def legal_moves(square_object, board)
    forward_array = []
    backward_array = []
    left_array = []
    right_array = []
    while times <= 7
      forward_array << (square_object.dup.add_row(1)) # forward 1 more square
      right_array << (square_object.dup.add_column(1)) # right 1 more square
      backward_array << (square_object.dup.add_row(-1)) # backward 1 square
      left_array << (square_object.dup.add_column(-1)) # left 1 square
      times += 1
    end

    forward_array = legal_moves_delete(forward_array, board)
    backward_array = legal_moves_delete(backward_array, board)
    left_array = legal_moves_delete(left_array, board)
    right_array = legal_moves_delete(right_array, board)

    array_of_squares << forward_array + backward_array + left_array + right_array
  end

  # helper for legal_moves
  def legal_moves_delete(direction_array, board, direction)

    direction_array = direction_array.filter do |square|
      # if this square contains a piece,
      if content != nil
        # delete this square and everything after it from the direction_array
      end
    end

    direction_array.each do |square|
      content = board.get_square_content(square)
      if content != nil                       # if it's not empty
        if content.color == self.color        # if it's the same color as my King
          direction_array.delete(square)
        end
      end
    end


    direction_array
  end

  def to_s

  end

end
