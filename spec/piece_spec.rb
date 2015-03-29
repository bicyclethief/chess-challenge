require_relative '../board'

describe "Piece" do

  describe "#opponent?" do
    it "should return true if opponent piece" do
      piece1 = Piece.new(Piece::COLOR_WHITE)
      piece2 = Piece.new(Piece::COLOR_BLACK)
      expect(piece1.opponent?(piece2)).to eq(true)
    end

    it "should return false if own white piece" do
      piece1 = Piece.new(Piece::COLOR_WHITE)
      piece2 = Piece.new(Piece::COLOR_WHITE)
      expect(piece1.opponent?(piece2)).to eq(false)
    end

    it "should return false if own black piece" do
      piece1 = Piece.new(Piece::COLOR_BLACK)
      piece2 = Piece.new(Piece::COLOR_BLACK)
      expect(piece1.opponent?(piece2)).to eq(false)
    end
  end

  describe "#legal_moves_delete" do
    it "deletes all invalid squares" do
      array = []
      e5 = Square.new('e', 5)
      bad1 = Square.new(nil, 3)
      f8 = Square.new('f', 8)
      bad2 = Square.new('b', nil)
      a1 = Square.new('a', 1)
      bad3 = Square.new(nil, nil)
      array << e5 << bad1 << f8 << bad2 << a1 << bad3
      board = Board.new
      piece = Piece.new(Piece::COLOR_BLACK)
      expect(piece.send :legal_moves_delete,array, board).to eq([e5, f8, a1])
    end

  end
end