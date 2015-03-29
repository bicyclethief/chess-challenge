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

  it "should consider moving 1 or 2 forward valid if the piece hasn't moved" do
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
    black_pawn = Pawn.new(Piece::COLOR_BLACK)
    board.place_piece(e5, black_pawn)

    e5match = white_king.legal_moves(f6, board).any? {|square| square.equal?(e5)}
    expect(e5match).to eq(true)

  end

  it "should consider a move invalid if it would land on an opponent piece vertically" do
    board = Board.new

    a2 = Square.new('a', 2)
    a3 = Square.new('a', 3)

    white_pawn = Pawn.new(Piece::COLOR_WHITE)
    black_pawn = Pawn.new(Piece::COLOR_BLACK)

    board.place_piece(a2, white_pawn)
    board.place_piece(a3, black_pawn)

    # white pawn
    a3match = white_pawn.legal_moves(a2, board).any? {|square| square.equal?(a3)}
    expect(a3match).to eq(false)

  end

  it "should include capture moves for black and white" do
    board = Board.new
    e4 = Square.new('e', 4)
    f5 = Square.new('f', 5)
    d5 = Square.new('d', 5)
    g4 = Square.new('g', 4)
    e4_pawn = Pawn.new(Piece::COLOR_WHITE)
    g4_pawn = Pawn.new(Piece::COLOR_WHITE)
    d5_pawn = Pawn.new(Piece::COLOR_BLACK)
    f5_pawn = Pawn.new(Piece::COLOR_BLACK)
    e4_pawn.set_moved
    g4_pawn.set_moved
    d5_pawn.set_moved
    f5_pawn.set_moved
    board.place_piece(e4, e4_pawn)
    board.place_piece(g4, g4_pawn)
    board.place_piece(d5, d5_pawn)
    board.place_piece(f5, f5_pawn)

    e4_legal_moves = e4_pawn.legal_moves(e4, board)
    g4_legal_moves = g4_pawn.legal_moves(g4, board)
    f5_legal_moves = f5_pawn.legal_moves(f5, board)

    d5_match = e4_legal_moves.any? { |square| square.equal?(Square.new('d', 5)) }
    f5_match = e4_legal_moves.any? { |square| square.equal?(Square.new('f', 5)) }

    expect(d5_match).to eq(true)
    expect(f5_match).to eq(true)

    e4_match = f5_legal_moves.any? { |square| square.equal?(Square.new('e', 4)) }
    g4_match = f5_legal_moves.any? { |square| square.equal?(Square.new('g', 4)) }

    expect(e4_match).to eq(true)
    expect(g4_match).to eq(true)
  end
end
