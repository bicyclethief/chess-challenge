require_relative '../piece'

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
end