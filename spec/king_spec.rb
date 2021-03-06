require_relative '../king'
require_relative '../rook'
require_relative '../piece'

describe "King" do

  it "should consider moving 1 forward, 1 backward, 1 left, or 1 right valid within bounds
  on an empty board" do
    board = Board.new
    d2 = Square.new('d', 2)
    white_king = King.new(Piece::COLOR_WHITE)
    board.place_piece(d2, white_king)

    d1 = Square.new('d', 1)
    d3 = Square.new('d', 3)
    c2 = Square.new('c', 2)
    e2 = Square.new('e', 2)

    d1match = white_king.legal_moves(d2, board).any? {|square| square.equal?(d1)}
    expect(d1match).to eq(true)

    d3match = white_king.legal_moves(d2, board).any? {|square| square.equal?(d3)}
    expect(d3match).to eq(true)

    c2match = white_king.legal_moves(d2, board).any? {|square| square.equal?(c2)}
    expect(c2match).to eq(true)

    e2match = white_king.legal_moves(d2, board).any? {|square| square.equal?(e2)}
    expect(e2match).to eq(true)
  end

  it "should consider moving 1 diagonally in any direction valid within bounds on an empty board" do
    board = Board.new
    f6 = Square.new('f', 6)
    white_king = King.new(Piece::COLOR_WHITE)
    board.place_piece(f6, white_king)

    e5 = Square.new('e', 5)
    g5 = Square.new('g', 5)
    g7 = Square.new('g', 7)
    e7 = Square.new('e', 7)

    e5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e5)}
    expect(e5match).to eq(true)

    g5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(g5)}
    expect(g5match).to eq(true)

    g7match = white_king.legal_moves(f6, board).any? {|square| square.equal?(g7)}
    expect(g7match).to eq(true)

    e7match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e7)}
    expect(e7match).to eq(true)

  end

  it "should consider a move invalid if it would land on a piece of the same color" do
    board = Board.new
    f6 = Square.new('f', 6)
    e5 = Square.new('e', 5)
    white_king = King.new(Piece::COLOR_WHITE)
    board.place_piece(f6, white_king)
    white_rook = King.new(Piece::COLOR_WHITE)
    board.place_piece(e5, white_rook)

    e5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e5)}
    expect(e5match).to eq(false)

  end

  it "should consider a move valid if it would land on an opponent piece" do
    board = Board.new
    f6 = Square.new('f', 6)
    e5 = Square.new('e', 5)
    white_king = King.new(Piece::COLOR_WHITE)
    board.place_piece(f6, white_king)
    black_knight = Knight.new(Piece::COLOR_BLACK)
    board.place_piece(e5, black_knight)

    e5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e5)}
    expect(e5match).to eq(true)
  end

  it "should continue to work as expected when King is on an edge of the board" do
    d1 = Square.new('d', 1)
    d2 = Square.new('d', 2)
    white_king = King.new(Piece::COLOR_WHITE)
    board2 = Board.new
    board2.place_piece(d1, white_king)

    d2match = white_king.legal_moves(d1, board2).any? {|square| square.equal?(d2)}
    expect(d2match).to eq(true)
  end

  describe "#avoid_checkmate" do
    it "should return a moves list excluding squares attacked by enemy pieces" do
        board = Board.new
        h1 = Square.new('h', 1)
        g8 = Square.new('g', 8)
        w_king = King.new(Piece::COLOR_WHITE)
        b_rook = Rook.new(Piece::COLOR_BLACK)
        board.place_piece(h1, w_king)
        board.place_piece(g8, b_rook)
        legal_moves = w_king.legal_moves(h1, board)

        expect(legal_moves.length).to eq(1)
        expect(legal_moves.first.equal?(Square.new('h', 2))).to eq (true)
    end
  end

end
