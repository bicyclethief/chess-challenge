require_relative '../square'
require_relative '../coordinate'
require_relative '../notation'

describe Notation do

  describe "to_chess_notation" do
    it "should return the a8 from a grid notation of 0,0" do
      coordinate = Coordinate.new(0, 0)
      square = Notation.to_chess_notation(coordinate)
      expect(square.column).to eq('a')
      expect(square.row).to eq(8)
    end

    it "should return the a1 from a grid notation of 7,0" do
      coordinate = Coordinate.new(7, 0)
      square = Notation.to_chess_notation(coordinate)
      expect(square.column).to eq('a')
      expect(square.row).to eq(1)
    end

    it "should return the a1 from a grid notation of 0,7" do
      coordinate = Coordinate.new(0, 7)
      square = Notation.to_chess_notation(coordinate)
      expect(square.column).to eq('h')
      expect(square.row).to eq(8)
    end

    it "should return the a1 from a grid notation of 7,7" do
      coordinate = Coordinate.new(7, 7)
      square = Notation.to_chess_notation(coordinate)
      expect(square.column).to eq('h')
      expect(square.row).to eq(1)
    end
  end

  describe "to_grid_notation" do
    it "should return the 0,0 from a chess notation of a8" do
      square = Square.new('a', 8)
      coordinate = Notation.to_grid_notation(square)
      expect(coordinate.column).to eq(0)
      expect(coordinate.row).to eq(0)
    end

    it "should return the 7,0 from a chess notation of a1" do
      square = Square.new('a', 1)
      coordinate = Notation.to_grid_notation(square)
      expect(coordinate.column).to eq(0)
      expect(coordinate.row).to eq(7)
    end

    it "should return the 0,7 from a chess notation of h8" do
      square = Square.new('h', 8)
      coordinate = Notation.to_grid_notation(square)
      expect(coordinate.column).to eq(7)
      expect(coordinate.row).to eq(0)
    end

    it "should return the 7,7 from a chess notation of h1" do
      square = Square.new('h', 1)
      coordinate = Notation.to_grid_notation(square)
      expect(coordinate.column).to eq(7)
      expect(coordinate.row).to eq(7)
    end

  end
end