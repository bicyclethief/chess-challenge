require_relative '../board'
require_relative '../coordinate'
require_relative '../piece'
require_relative '../square'


# board = Board.new
# d2 = Square.new('d', 2)
# white_king = King.new(Piece::COLOR_WHITE)
# board.place_piece(d2, white_king)

# d1 = Square.new('d', 1)
# puts white_king.legal_moves(d2, board)
# white_king.legal_moves(d2, board).any? do |square|
#   puts "Row: #{square.row}, Column: #{square.column}"
# end

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

board = Board.new
d1 = Square.new('d', 1)
d2 = Square.new('d', 2)
white_king = King.new(Piece::COLOR_WHITE)
board2 = Board.new
board.place_piece(d1, white_king)

white_king.legal_moves(d1, board).any? {|square| square.equal?(d2)}