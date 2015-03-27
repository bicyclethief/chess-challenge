require_relative '../board'

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
    it "should return false for a column not a-h" do
      expect(board.out_of_bounds?(Square.new('k', 3))).to eq(false)
    end

    it "should return false for a row less than 1" do
      (-5..0).each do |row|
        expect(board.out_of_bounds?(Square.new('b', row))).to eq(false)
      end
    end

    it "should return false for a row greater than 8" do
      (9..20).each do |row|
        expect(board.out_of_bounds?(Square.new('b', row))).to eq(false)
      end
    end
  end

end
