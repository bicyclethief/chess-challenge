require_relative '../square'

describe "Square" do

  let(:square) { Square.new('a', 1) }

  describe "#add_row" do
    it "should add to the row" do
      times = 1
      while times <= 7
        square.add_row(1)
        expect(square.row).to eq(1 + times)
        times += 1
      end
    end
  end

  describe "#add_column" do
    it "should add to the column" do
      letters = ('a'..'h').to_a
      times = 1
      while times <= 7
        square.add_column(1)
        expect(square.row).to eq(letters[1 + times])
        times += 1
      end
    end
  end

end