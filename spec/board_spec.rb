require 'pry'
require_relative '../board'
require_relative '../notation'
require_relative '../piece'

describe "Board" do

  let(:board) { Board.new }

  describe "constructor" do
    it "should create a blank board" do
      flatten_uniq = board.board.flatten.uniq
      expect(flatten_uniq.length).to eq(1)
      expect(flatten_uniq.first).to eq(nil)
    end
  end

  describe "#out_of_bounds?" do
    it "should return true for a column not a-h" do
      expect(board.out_of_bounds?(Square.new('k', 3))).to eq(true)
    end

    it "should return true for a row less than 1" do
      (-5..0).each do |row|
        expect(board.out_of_bounds?(Square.new('b', row))).to eq(true)
      end
    end

    it "should return true for a row greater than 8" do
      (9..20).each do |row|
        expect(board.out_of_bounds?(Square.new('b', row))).to eq(true)
      end
    end
  end

  describe "#place_piece" do
    it "place the piece on the desired square" do
      king = King.new(Piece::COLOR_WHITE)
      square = Square.new('e', 1)
      board.place_piece(square, king)
      coordinate = Notation.to_grid_notation(square)
      expect(board.board[coordinate.row][coordinate.column]).to eq(king)
    end
  end

  describe "#get_square_content" do
    it "returns nil for an out of bounds square" do
      expect(board.get_square_content(Square.new('j', 1))).to eq(nil)
      expect(board.get_square_content(Square.new('g', 0))).to eq(nil)
      expect(board.get_square_content(Square.new('g', 13))).to eq(nil)
    end

    it "returns nil for an empty square" do
      expect(board.get_square_content(Square.new('e', 5))).to eq(nil)
    end

    it "returns Piece for an occupied square" do
      bishop = Bishop.new(Piece::COLOR_WHITE)
      square = Square.new('e', 6)
      board.place_piece(square, bishop)
      expect(board.get_square_content(square)).to eq(bishop)
    end
  end
end
