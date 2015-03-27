require_relative '../bishop'
require_relative '../piece'

describe "Bishop" do

  it "should consider all diagonal moves valid within bounds on an empty board" do
    board = Board.new
    d3 = Square.new('d', 3)
    white_right_bishop = Bishop.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_bishop)

    expect(white_right_bishop.legal_moves(d3, board)).include?(Square.new('c', 4)).to eq(true)
  end

  it "should consider a move invalid if it would land on a piece of the same color" do

  end

  it "should consider a move valid if it would land on an opponent piece" do

  end

  it "should consider a move invalid if any pieces are blocking its path to the destination square" do

  end

end
