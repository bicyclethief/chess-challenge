require_relative 'coordinate'
require_relative 'notation'
require_relative 'game'
require_relative 'king'
require_relative 'piece'
require_relative 'rook'
require_relative 'square'
require_relative 'bishop'

def Board

  include Notation

  attr_accessor :board

  def initialize(args)
    @board = args[:board]   # a nested array
  end

  def get_piece_to_move(square, player)
   # return Piece or nil (if empty or opponent's piece)
  end

  # place piece on board
  def set_piece(square, piece)

  end

  def out_of_bounds?(square)

  end

  # return nil if empty; return Piece if not empty
  def get_square_content(square)

  end

end
