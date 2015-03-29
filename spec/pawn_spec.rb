require_relative '../pawn'
require_relative '../bishop'
require_relative '../piece'

describe "Pawn" do

  it "should consider moving 1 forward valid if the piece has moved" do
    board = Board.new

    a2 = Square.new('a', 2)
    a3 = Square.new('a', 3)
    a7 = Square.new('a', 7)
    a6 = Square.new('a', 6)

    white_pawn = Pawn.new(Piece::COLOR_WHITE)
    black_pawn = Pawn.new(Piece::COLOR_BLACK)

    board.place_piece(a2, white_pawn)
    board.place_piece(a7, black_pawn)

    white_pawn.set_moved
    black_pawn.set_moved

    # white pawn
    a3match = white_pawn.legal_moves(a2, board).any? {|square| square.equal?(a3)}
    expect(a3match).to eq(true)

    # black pawn
    a6match = black_pawn.legal_moves(a7, board).any? {|square| square.equal?(a6)}
    expect(a6match).to eq(true)
  end

  it "should consider moving 2 forward invalid if the piece has moved" do
    board = Board.new

    a2 = Square.new('a', 2)
    a4 = Square.new('a', 4)
    a7 = Square.new('a', 7)
    a5 = Square.new('a', 5)

    white_pawn = Pawn.new(Piece::COLOR_WHITE)
    black_pawn = Pawn.new(Piece::COLOR_BLACK)

    board.place_piece(a2, white_pawn)
    board.place_piece(a7, black_pawn)

    white_pawn.set_moved
    black_pawn.set_moved

    # white pawn
    a4match = white_pawn.legal_moves(a2, board).any? {|square| square.equal?(a4)}
    expect(a4match).to eq(false)

    # black pawn
    a5match = black_pawn.legal_moves(a7, board).any? {|square| square.equal?(a5)}
    expect(a5match).to eq(false)

  end

  # it "should consider moving 1 or 2 up valid if the piece hasn't moved" do
  #   board = Board.new
  #   f6 = Square.new('f', 6)
  #   white_king = King.new(Piece::COLOR_WHITE)
  #   board.place_piece(f6, white_king)

  #   e5 = Square.new('e', 5)
  #   g5 = Square.new('g', 5)
  #   g7 = Square.new('g', 7)
  #   e7 = Square.new('e', 7)

  #   e5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e5)}
  #   expect(e5match).to eq(true)

  #   g5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(g5)}
  #   expect(g5match).to eq(true)

  #   g7match = white_king.legal_moves(f6, board).any? {|square| square.equal?(g7)}
  #   expect(g7match).to eq(true)

  #   e7match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e7)}
  #   expect(e7match).to eq(true)

  # end

  # it "should consider a move invalid if it would land on a piece of the same color" do
  #   board = Board.new
  #   f6 = Square.new('f', 6)
  #   e5 = Square.new('e', 5)
  #   white_king = King.new(Piece::COLOR_WHITE)
  #   board.place_piece(f6, white_king)
  #   white_rook = King.new(Piece::COLOR_WHITE)
  #   board.place_piece(e5, white_rook)

  #   e5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e5)}
  #   expect(e5match).to eq(false)

  # end

  # it "should consider a move invalid if it would land on an opponent piece vertically" do


  # end

  # it "should consider a move valid if it would land on an opponent piece diagonally" do
  #   board = Board.new
  #   f6 = Square.new('f', 6)
  #   e5 = Square.new('e', 5)
  #   white_king = King.new(Piece::COLOR_WHITE)
  #   board.place_piece(f6, white_king)
  #   black_king = King.new(Piece::COLOR_BLACK)
  #   board.place_piece(e5, black_king)

  #   e5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e5)}
  #   expect(e5match).to eq(true)

  # end


end
