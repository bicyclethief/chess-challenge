require_relative '../king'
require_relative '../rook'
require_relative '../piece'

describe "Rook" do

  it "should consider moving 1 forward, 1 backward, 1 left, or 1 right valid within bounds on an empty board" do
    board = Board.new
    d2 = Square.new('d', 2)
    white_rook = Rook.new(Piece::COLOR_WHITE)
    board.place_piece(d2, white_rook)

    d1 = Square.new('d', 1)
    d3 = Square.new('d', 3)
    c2 = Square.new('c', 2)
    e2 = Square.new('e', 2)

    d1match = white_rook.legal_moves(d2, board).any? {|square| square.equal?(d1)}
    expect(d1match).to eq(true)

    d3match = white_rook.legal_moves(d2, board).any? {|square| square.equal?(d3)}
    expect(d3match).to eq(true)

    c2match = white_rook.legal_moves(d2, board).any? {|square| square.equal?(c2)}
    expect(c2match).to eq(true)

    e2match = white_rook.legal_moves(d2, board).any? {|square| square.equal?(e2)}
    expect(e2match).to eq(true)
  end

  it "should consider moving 7 forward, 7 backward, 7 left, or 7 right valid within bounds valid on an empty board" do
    board = Board.new
    h1 = Square.new('h', 1)
    h8 = Square.new('h', 8)
    a1 = Square.new('a', 1)
    a8 = Square.new('a', 8)
    # check left and up
    white_rook = Rook.new(Piece::COLOR_WHITE)
    board.place_piece(h1, white_rook)

    h8match = white_rook.legal_moves(h1, board).any? {|square| square.equal?(h8)}
    expect(h8match).to eq(true)
    a1match = white_rook.legal_moves(h1, board).any? {|square| square.equal?(a1)}
    expect(a1match).to eq(true)
    # check right and down
    board2 = Board.new
    board2.place_piece(a8, white_rook)

    h8match = white_rook.legal_moves(a8, board2).any? {|square| square.equal?(h8)}
    expect(h8match).to eq(true)
    a1match = white_rook.legal_moves(a8, board2).any? {|square| square.equal?(a1)}
    expect(a1match).to eq(true)

  end

  it "should consider a move invalid if it would land on a piece of the same color" do
    board = Board.new
    h1 = Square.new('h', 1)
    h8 = Square.new('h', 8)
    a1 = Square.new('a', 1)
    a8 = Square.new('a', 8)

    white_rook = Rook.new(Piece::COLOR_WHITE)
    board.place_piece(h1, white_rook)
    white_king = King.new(Piece::COLOR_WHITE)
    board.place_piece(h8, white_king)

    h8match = white_rook.legal_moves(h1, board).any? {|square| square.equal?(h8)}
    expect(h8match).to eq(false)

  end

  it "should consider a move valid if it would land on an opponent piece" do
    board = Board.new
    h1 = Square.new('h', 1)
    h8 = Square.new('h', 8)
    a1 = Square.new('a', 1)
    a8 = Square.new('a', 8)

    white_rook = Rook.new(Piece::COLOR_WHITE)
    board.place_piece(h1, white_rook)
    black_king = King.new(Piece::COLOR_BLACK)
    board.place_piece(h8, black_king)

    h8match = white_rook.legal_moves(h1, board).any? {|square| square.equal?(h8)}
    expect(h8match).to eq(true)

  end

  it "should consider a move invalid if any piece is blocking its path to the
  destination square" do
    # same color piece blocking

    board = Board.new
    h1 = Square.new('h', 1)
    h6 = Square.new('h', 6)
    h8 = Square.new('h', 8)

    white_rook = Rook.new(Piece::COLOR_WHITE)
    board.place_piece(h1, white_rook)
    white_king = King.new(Piece::COLOR_WHITE)
    board.place_piece(h6, white_king)

    h8match = white_rook.legal_moves(h1, board).any? {|square| square.equal?(h8)}
    expect(h8match).to eq(false)

    # opponent piece blocking

    board2 = Board.new

    board2.place_piece(h1, white_rook)
    black_king = King.new(Piece::COLOR_BLACK)
    board2.place_piece(h6, black_king)

    h8match = white_rook.legal_moves(h1, board2).any? {|square| square.equal?(h8)}
    expect(h8match).to eq(false)

  end

  it "should consider out of bounds moves invalid" do
    board = Board.new
    h1 = Square.new('h', 1)
    h6 = Square.new('h', 6)
    h8 = Square.new('h', 8)

    white_rook = Rook.new(Piece::COLOR_WHITE)
    board.place_piece(h1, white_rook)
    white_king = King.new(Piece::COLOR_WHITE)
    board.place_piece(h6, white_king)

    nils = white_rook.legal_moves(h1, board).any? {|square| square.row == nil || square.column == nil}

    expect(nils).to eq(false)

  end

end
