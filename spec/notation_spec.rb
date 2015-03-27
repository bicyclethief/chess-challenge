require_relative '../square'
require_relative '../coordinate'
require_relative '../notation'

describe Notation do

  class DummyClass
  end

  before(:all) do
    @dummy = DummyClass.new
    @dummy.extend Notation
  end

  describe "to_chess_notation" do
    it "should return the proper chess notation from a grid notation" do
      (0..7).each do |row|
        letters = ('a'..'h').to_a
        coordinate = Coordinate.new(row, 0)
        square = @dummy.to_chess_notation(coordinate)
        expect(square.column).to eq(letters[row])
        expect(square.row).to eq(row)
      end
    end
  end

  describe "to_grid_notation" do
  end
end