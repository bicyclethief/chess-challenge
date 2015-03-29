require_relative '../pawn'
require_relative '../queen'
require_relative '../piece'

describe "Queen" do

  it "should consider all diagonal moves valid within bounds on an empty board" do
    board = Board.new
    d3 = Square.new('d', 3)
    a6 = Square.new('a', 6)

    white_right_queen = Queen.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_queen)

    a6match = white_right_queen.legal_moves(d3, board).any? {|square| square.equal?(a6)}
    expect(a6match).to eq(true)

  end

  it "should consider moving 1 forward, 1 backward, 1 left, or 1 right valid within bounds on an empty board" do
    board = Board.new
    d2 = Square.new('d', 2)
    white_queen = Queen.new(Piece::COLOR_WHITE)
    board.place_piece(d2, white_queen)

    d1 = Square.new('d', 1)
    d3 = Square.new('d', 3)
    c2 = Square.new('c', 2)
    e2 = Square.new('e', 2)

    d1match = white_queen.legal_moves(d2, board).any? {|square| square.equal?(d1)}
    expect(d1match).to eq(true)

    d3match = white_queen.legal_moves(d2, board).any? {|square| square.equal?(d3)}
    expect(d3match).to eq(true)

    c2match = white_queen.legal_moves(d2, board).any? {|square| square.equal?(c2)}
    expect(c2match).to eq(true)

    e2match = white_queen.legal_moves(d2, board).any? {|square| square.equal?(e2)}
    expect(e2match).to eq(true)
  end

  it "should consider moving 7 forward, 7 backward, 7 left, or 7 right valid within bounds valid on an empty board" do
    board = Board.new
    h1 = Square.new('h', 1)
    h8 = Square.new('h', 8)
    a1 = Square.new('a', 1)
    a8 = Square.new('a', 8)
    # check left and up
    white_queen = Queen.new(Piece::COLOR_WHITE)
    board.place_piece(h1, white_queen)

    h8match = white_queen.legal_moves(h1, board).any? {|square| square.equal?(h8)}
    expect(h8match).to eq(true)
    a1match = white_queen.legal_moves(h1, board).any? {|square| square.equal?(a1)}
    expect(a1match).to eq(true)
    # check right and down
    board2 = Board.new
    board2.place_piece(a8, white_queen)

    h8match = white_queen.legal_moves(a8, board2).any? {|square| square.equal?(h8)}
    expect(h8match).to eq(true)
    a1match = white_queen.legal_moves(a8, board2).any? {|square| square.equal?(a1)}
    expect(a1match).to eq(true)

  end

  it "should consider a move invalid if it would land on a piece of the same color" do
    board = Board.new
    d3 = Square.new('d', 3)
    c4 = Square.new('c', 4)

    white_right_queen = Queen.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_queen)

    white_pawn = Pawn.new(Piece::COLOR_WHITE)
    board.place_piece(c4, white_pawn)

    c4match = white_right_queen.legal_moves(d3, board).any? {|square| square.equal?(c4)}
    expect(c4match).to eq(false)

  end

  it "should consider a move valid if it would land on an opponent piece" do
    board = Board.new
    d3 = Square.new('d', 3)
    c4 = Square.new('c', 4)

    white_right_queen = Queen.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_queen)

    black_pawn = Pawn.new(Piece::COLOR_BLACK)
    board.place_piece(c4, black_pawn)

    c4match = white_right_queen.legal_moves(d3, board).any? {|square| square.equal?(c4)}
    expect(c4match).to eq(true)

  end

  it "should consider a move invalid if any pieces are blocking its path to the destination square" do
    board = Board.new
    d3 = Square.new('d', 3)
    c4 = Square.new('c', 4)
    a6 = Square.new('a', 6)

    white_right_queen = Queen.new(Piece::COLOR_WHITE)
    board.place_piece(d3, white_right_queen)

    white_pawn = Pawn.new(Piece::COLOR_WHITE)
    board.place_piece(c4, white_pawn)

    a6match = white_right_queen.legal_moves(d3, board).any? {|square| square.equal?(a6)}
    expect(a6match).to eq(false)

  end

  # it "should consider out of bounds moves invalid" do
  #   board = Board.new
  #   h1 = Square.new('h', 1)

  #   white_queen = Queen.new(Piece::COLOR_WHITE)
  #   board.place_piece(h1, white_queen)

  #   nils = white_queen.legal_moves(h1, board).any? {|square| square.row == nil || square.column == nil}

  #   expect(nils).to eq(false)
  # end


end