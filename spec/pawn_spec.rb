require 'byebug'
require_relative '../pawn'
require_relative '../piece'

describe "Pawn" do

  it "should consider moving 1 up valid within bounds
  on an empty board if the piece has moved" do
    board = Board.new
    d2 = Square.new('d', 2)
    white_pawn = Pawn.new(Piece::COLOR_WHITE)
    black_pawn = Pawn.new(Piece::COLOR_BLACK)
    d4 = Square.new('d', 4)
    board.place_piece(d4, black_pawn)
    white_pawn.legal_moves(d2, board)

    d4match = white_pawn.legal_moves(d2, board).any? {|square| square.equal?(d4)}
    expect(d4match).to eq(true)

  end

  it "should consider moving 1 or 2 up if the piece has not moved in any direction valid within bounds on an empty board" do
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

  it "should consider a move valid if it would land on an opponent piece diagonally" do
    board = Board.new
    f6 = Square.new('f', 6)
    e5 = Square.new('e', 5)
    white_king = King.new(Piece::COLOR_WHITE)
    board.place_piece(f6, white_king)
    black_king = King.new(Piece::COLOR_BLACK)
    board.place_piece(e5, black_king)

    e5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e5)}
    expect(e5match).to eq(true)
  end


end
