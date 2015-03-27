require_relative '../board'
require_relative '../coordinate'
require_relative '../piece'
require_relative '../square'


board = Board.new
d2 = Square.new('d', 2)
white_king = King.new(Piece::COLOR_WHITE)
board.place_piece(d2, white_king)

d1 = Square.new('d', 1)
puts white_king.legal_moves(d2, board)
white_king.legal_moves(d2, board).any? do |square|
  puts "Row: #{square.row}, Column: #{square.column}"
end
