require_relative '../board'
require_relative '../coordinate'
require_relative '../piece'
require_relative '../square'
require_relative '../notation'


board = Board.new
d2 = Square.new('d', 2)
white_king = King.new(Piece::COLOR_WHITE)
board.place_piece(d2, white_king)

d1 = Square.new('d', 1)
puts "Legal Moves: " + white_king.legal_moves(d2, board).to_s

# board = Board.new
# h1 = Square.new('h', 1)
# h8 = Square.new('h', 8)
# a1 = Square.new('a', 1)
# a8 = Square.new('a', 8)

# white_bishop = Bishop.new(Piece::COLOR_WHITE)
# board.place_piece(h1, white_bishop)
# white_king = King.new(Piece::COLOR_WHITE)
# board.place_piece(h8, white_king)

# h8match = white_bishop.legal_moves(h1, board).any? {|square| square.equal?(h8)}

# board = Board.new
# d1 = Square.new('d', 1)
# d2 = Square.new('d', 2)
# white_king = King.new(Piece::COLOR_WHITE)
# board2 = Board.new
# board.place_piece(d1, white_king)

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
# board.each_square_with_location do |piece, location|
#   if piece != nil
#     puts piece.legal_moves(location, board)
#   end
# end