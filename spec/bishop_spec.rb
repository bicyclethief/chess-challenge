require_relative '../bishop'
require_relative '../piece'

describe "Bishop" do

  it "should consider all diagonal moves valid within bounds on an empty board" do
    board = Board.new
    d3 = Square.new('d', 3)
    a6 = Square.new('a', 6)

    white_right_bishop = Bishop.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_bishop)

    expect(white_right_bishop.legal_moves(d3, board)).include?(a6).to eq(true)
  end

  it "should consider a move invalid if it would land on a piece of the same color" do
    board = Board.new
    d3 = Square.new('d', 3)
    c4 = Square.new('c', 4)

    white_right_bishop = Bishop.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_bishop)

    white_queen = Queen.new(Piece::COLOR_WHITE)
    board.place_piece(c4, white_queen)

    expect(white_right_bishop.legal_moves(d3, board)).include?(c4).to eq(false)
  end

  it "should consider a move valid if it would land on an opponent piece" do
    board = Board.new
    d3 = Square.new('d', 3)
    c4 = Square.new('c', 4)

    white_right_bishop = Bishop.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_bishop)

    black_queen = Queen.new(Piece::COLOR_BLACK)
    board.place_piece(c4, black_queen)

    expect(white_right_bishop.legal_moves(d3, board)).include?(c4).to eq(true)

  end

  it "should consider a move invalid if any pieces are blocking its path to the destination square" do
    board = Board.new
    d3 = Square.new('d', 3)
    c4 = Square.new('c', 4)
    a6 = Square.new('a', 6)

    white_right_bishop = Bishop.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_bishop)

    white_queen = Queen.new(Piece::COLOR_WHITE)
    board.place_piece(c4, white_queen)

    expect(white_right_bishop.legal_moves(d3, board)).include?(a6).to eq(false)
  end

end
