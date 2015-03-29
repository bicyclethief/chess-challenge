require_relative 'square'
require_relative 'board'
require_relative 'coordinate'

# Piece is an abstract superclass for specific Piece classes such as Pawn, Rook, etc.
class Piece

  COLOR_WHITE = 1
  COLOR_BLACK = 0

  attr_reader :color

  def initialize(color)
    @color = color
    @moved = false
  end

  def legal_moves(square_object, board_object)
  end

  def moved?
    @moved
  end

  def set_moved
    @moved = true
  end

  def opponent?(piece)
    self.color != piece.color
  end

  def to_s
  end

  def name
    self.class.to_s.downcase
  end

  private

  # helper for legal_moves: implemented by Rook, Bishop, Queen, King.
  # Knight overwrites it.
  def legal_moves_delete(direction_array, board)

    # delete all squares after and including the one with a friend piece
    friend_index = direction_array.find_index do |square|
      content = board.get_square_content(square)
      !content.nil? && !self.opponent?(content)
    end
    direction_array = direction_array.slice!(0, friend_index) if ! friend_index.nil?

    # delete all squares after one with an opponent piece
    enemy_index = direction_array.find_index do |square|
      content = board.get_square_content(square)
      !content.nil? && self.opponent?(content)
    end
    direction_array = direction_array.slice!(0, enemy_index+1) if ! enemy_index.nil?

    # delete invalid squares
    direction_array = delete_bad_squares(direction_array, board)

    direction_array
  end

  def delete_friend_occupied_squares(squares, board)
    squares.delete_if do |square|
      content = board.get_square_content(square)
      !content.nil? && !self.opponent?(content)
    end
  end

  def delete_bad_squares(squares, board)
    squares.delete_if do |square|
      board.out_of_bounds?(square)
    end
  end
end

