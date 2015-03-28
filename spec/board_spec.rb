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

  describe "#move_piece" do

    before(:each) do
      @bishop = Bishop.new(Piece::COLOR_WHITE)
      @origin_square = Square.new('f', 1)
      @knight = Knight.new(Piece::COLOR_BLACK)
      @destination_square = Square.new('b', 5)
      board.place_piece(@origin_square, @bishop)
      board.place_piece(@destination_square, @knight)
      @captured_piece = board.move_piece(@origin_square, @destination_square)

      @knight2 = Knight.new(Piece::COLOR_BLACK)
      @origin_square2 = Square.new('b', 1)
      @destination_square2 = Square.new('c', 3)
      board.place_piece(@origin_square2, @knight2)
    end

    it "should move the piece to the destination square" do
      expect(board.get_square_content(@destination_square)).to eq(@bishop)
    end

    it "should empty the origin square" do
      expect(board.get_square_content(@origin_square)).to eq(nil)
    end

    it "should mark the moved piece has having moved" do
      expect(@knight2.moved?).to eq(false)
      board.move_piece(@origin_square2, @destination_square2)
      expect(@knight2.moved?).to eq(true)
    end

    it "should return the Piece that was on the destination square" do
      expect(@captured_piece).to eq(@knight)
    end

    it "should return nil if the destination square was empty" do
      destination_content = board.move_piece(@origin_square2, @destination_square2)
      expect(destination_content).to eq(nil)
    end
  end
end
