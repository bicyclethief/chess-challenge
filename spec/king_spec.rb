require 'byebug'
require_relative '../king'
require_relative '../piece'

describe "King" do

  it "should consider moving 1 forward, 1 backward, 1 left, or 1 right valid within bounds
  on an empty board" do
    board = Board.new
    d2 = Square.new('d', 2)
    white_king = King.new(Piece::COLOR_WHITE)
    board.place_piece(d2, white_king)

    d1 = Square.new('d', 1)
    byebug
    white_king.legal_moves(d2, board).any? do |square|
      expect(square.equal?(d1)).to eq(true)
    end

  end

  it "should consider moving 1 diagonally in any direction valid within bounds on an empty board" do

  end

  it "should consider a move invalid if it would land on a piece of the same color" do

  end

  it "should consider a move valid if it would land on an opponent piece" do

  end

end
