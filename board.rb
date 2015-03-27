require_relative 'square'
require_relative 'piece'
require_relative 'notation'
require_relative 'coordinate'
require_relative 'game'
require_relative 'king'
require_relative 'rook'
require_relative 'bishop'

class Board

  include Notation

  attr_reader :board

  def initialize(player1 = nil, player2 = nil)
    @board = Array.new(8) { Array.new(8) }
    @players = []
    @players << player1 if player1
    @players << player2 if player2
  end

  def get_piece_to_move(square, player)
   # return Piece or nil (if empty or opponent's piece)
  end

  # place piece on board
  def set_piece(square, piece)
    # coordinate = to_grid_notation(square)
  end

  def out_of_bounds?(square)
    return false if ! LETTERS.include?(square.column)
    return false if ! square.row.between?(1, 8)
  end

  # return nil if empty; return Piece if not empty
  def get_square_content(square)

  end

end


