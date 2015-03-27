require_relative "piece"
require_relative "square" #this is the file that has the square notation info

class Pawn < Piece

  # legal_moves(Square, Board): returns Array of Squares of legal moves
  def legal_moves(square_object, board_object)
    legal_moves = []
    legal_moves_up = []
    legal_moves_diagonal_left = []
    legal_moves_diagonal_right = []
    if @color == "white"
      if moved?
        square_object.add_row(1)
        legal_moves_up << square_object
      else
        square_object.add_row(1)
        legal_moves_up << square_object
        square_object.add_row(1)
        legal_moves_up << square_object
      end
      square_object.add_row(1)
      square_object.add_column(1)
      legal_moves_diagonal_right << square_object
      square_object_clone = square_object.dup
      square_object_clone.add(1)
      square_object_clone.add_column(-1)
      legal_moves_diagonal_right << square_object_clone
    else
      if moved?
        square_object.add_row(-1)
        legal_moves_up << [square_object]
      else
        square_object.add_row(-1)
        legal_moves_up << square_object
        square_object.add_row(-1)
        legal_moves_up << square_object
      end
      square_object.add_row(-1)
      square_object.add_column(1)
      legal_moves_diagonal_right << square_object
      square_object_clone = square_object.dup
      square_object_clone.add(-1)
      square_object_clone.add_column(-1)
      legal_moves_diagonal_left << square_object_clone
    end

    legal_moves_up.each do |square|
      legal_moves << square
      break if board.empty?(square) || board.out_of_bounds?(square)
    end

    legal_moves_diagonal_left.each do |square|
      legal_moves << square
      break if board.empty?(square) || board.out_of_bounds?(square)
    end

    legal_moves_diagonal_right.each do |square|
      legal_moves << square
      break if board.empty?(square) || board.out_of_bounds?(square)
    end
    legal_moves
  end




  def moved?
    @moved
  end

  def set_moved
    @moved = true
  end

  def to_s
    "♙"
  end

end
