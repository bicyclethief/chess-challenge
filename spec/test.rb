 require 'byebug'
 require_relative '../board'
 require_relative '../piece'
 require_relative '../square'
 require_relative '../bishop'

    board = Board.new
    d3 = Square.new('d', 3)
    white_right_bishop = Bishop.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_bishop)

    p white_right_bishop.legal_moves(d3, board)







 # .include?(Square.new('c', 4)
