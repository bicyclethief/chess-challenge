require_relative 'piece'
require_relative 'board'
require_relative 'square'

class Pawn < Piece

  def legal_moves(square_object, board_object)
    legal_moves_white = []
    legal_moves_up_black = []
    if self.COLOR_WHITE == 1
      if moved?
        square_object.add_row(1)
        if ! board.out_of_bouds?(square_object)
          content = board.get_square_content(square_object)
          if content.nil?
            legal_moves_white << square_object
          end
        end
      else
        square_object.add_row(2)
        if ! board.out_of_bouds?(square_object)
          content = board.get_square_content(square_object)
          if content.nil?
            legal_moves_white << square_object
          end
        end
      end
      square_diag = square_object.dup
      square_diag.add_row(1)
      square_diag.add_column(1)
      if ! board.out_of_bouds?(square_diag)
        content = board.get_square_content(square_diag)
        if ! content.nil? && self.opponent?(content)
          legal_moves_white << square_diag
        end
      end
      square_clone = square_object.dup
      square_clone.add_row(1)
      square_clone.add_column(-1)
      if ! board.out_of_bouds?(square_clone)
        content = board.get_square_content(square_clone)
        if ! content.nil? && self.opponent?(content)
          legal_moves_white << square_clone
        end
      end
    else
      if moved?
        square_object.add_row(-1)
        if ! board.out_of_bouds?(square_object)
          content = board.get_square_content(square_object)
          if content.nil?
            legal_moves_black << square_object
          end
        end
      else
        square_object.add_row(-2)
        if ! board.out_of_bouds?(square_object)
          content = board.get_square_content(square_object)
          if content.nil?
            legal_moves_black << square_object
          end
        end
      end
      square_diag = square_object.dup
      square_diag.add_row(-1)
      square_diag.add_column(-1)
      if ! board.out_of_bouds?(square_diag)
        content = board.get_square_content(square_diag)
        if ! content.nil? && self.opponent?(content)
          legal_moves_black << square_diag
        end
      end
      square_clone = square_object.dup
      square_clone.add_row(-1)
      square_clone.add_column(1)
      if ! board.out_of_bouds?(square_clone)
        content = board.get_square_content(square_clone)
        if ! content.nil? && self.opponent?(content)
          legal_moves_black << square_clone
        end
      end

      if self.COLOR_WHITE == 1
        return legal_moves_white
      else
        return legal_moves_up_black
      end
    end

    def moved?
      @moved
    end

    def set_moved
      @moved = true
    end

    def to_s
      (color == Piece::COLOR_WHITE) ? "♙" : "♟"
    end

  end
