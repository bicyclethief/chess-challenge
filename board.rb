require_relative 'bishop'
require_relative 'king'
require_relative 'game'
require_relative 'rook'
require_relative 'notation'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Board

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
  def place_piece(square, piece)
    return nil if out_of_bounds?(square)
    return nil if piece.nil?

    coordinate = Notation.to_grid_notation(square)
    @board[coordinate.row][coordinate.column] = piece
  end

  def out_of_bounds?(square)
    return false if ! Notation::LETTERS.include?(square.column)
    return false if ! square.row.between?(1, 8)
 end

  # return nil if empty; return Piece if not empty
  def get_square_content(square)

  end

  def to_s
    board_str = board.each_with_index.map do |row, row_index|
      row_label = Notation.to_chess_notation(Square.new(0, row_index)).row
      board_row = row.each_with_index.map do |content, col_index|
        (content.nil?) ? " " : content.to_s
      end
      "#{row_label} #{board_row.join(' ')}"
    end.join("\n")

    "#{board_str}\n  #{Notation::LETTERS.join(' ')}"
  end
end

# board = Board.new
# white_king = King.new(Piece::COLOR_WHITE)
# black_king = King.new(Piece::COLOR_BLACK)
# white_left_rook = Rook.new(Piece::COLOR_WHITE)
# white_right_rook = Rook.new(Piece::COLOR_WHITE)
# black_left_rook = Rook.new(Piece::COLOR_BLACK)
# black_right_rook = Rook.new(Piece::COLOR_BLACK)
# board.place_piece(Square.new('e', 8), black_king)
# board.place_piece(Square.new('e', 1), white_king)
# board.place_piece(Square.new('h', 8), black_right_rook)
# board.place_piece(Square.new('a', 8), black_left_rook)
# board.place_piece(Square.new('a', 1), white_left_rook)
# board.place_piece(Square.new('h', 1), white_right_rook)
# puts board

