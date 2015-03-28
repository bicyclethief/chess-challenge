require_relative '../square'

describe "Square" do

  let(:square) { Square.new('a', 1) }

  describe "#add_row" do
    it "should add to the row" do
      letters = ('a'..'h').to_a
      times = 1
      while times <= 7
        square.add_row(1)
        expect(square.column).to eq(letters[times])
        times += 1
      end
    end
  end

  describe "#add_column" do
    it "should add to the column" do
      times = 1
      while times <= 7
        square.add_column(1)
        expect(square.row).to eq(1 + times)
        times += 1
      end
    end
  end

  describe "#equal?" do
    it "should return true for two Squares with the same column and row" do
      square1 = Square.new('d', 5)
      square2 = Square.new('d', 5)
      expect(square1.equal?(square2)).to eq(true)
    end

    it "should return false for two Squares with a different column" do
      square1 = Square.new('d', 5)
      square2 = Square.new('f', 5)
      expect(square1.equal?(square2)).to eq(false)
    end

    it "should return false for two Squares with a different rows" do
      square1 = Square.new('h', 3)
      square2 = Square.new('h', 5)
      expect(square1.equal?(square2)).to eq(false)
    end
  end

  describe "#to_s" do
    it "should return the string of the square" do
      num = 1
      ('a'..'h').to_a.each do |letter|
        square = Square.new(letter, num)
        expect(square.to_s).to eq("#{letter}#{num}")
        num += 1
      end
    end
  end
end