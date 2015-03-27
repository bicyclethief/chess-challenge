# Controller

class Game

  attr_reader :player1, :player2
  attr_accessor :board

  # player1 & player2 are Player objects
  def initialize(args)
    @player1 = args[:player1]
    @player2 = args[:player2]
    @colors = [:white, :black].shuffle!
    @players = {@colors[0] => @player1,
                @colors[1] => @player2
                }

    @board = args[:board]
  end

  # creates and places pieces on board for a standard game of Chess
  def set_all_pieces(pieces)
    @board.set_piece("A1", Rook.new(:white))
    @board.set_piece("B1", Knight.new(:white))
    @board.set_piece("C1", Bishop.new(:white))
    @board.set_piece("D1", Queen.new(:white))
    @board.set_piece("E1", King.new(:white))
    @board.set_piece("F1", Bishop.new(:white))
    @board.set_piece("G1", Knight.new(:white))
    @board.set_piece("H1", Rook.new(:white))
    @board.set_piece("A2", Pawn.new(:white))
    @board.set_piece("B2", Pawn.new(:white))
    @board.set_piece("C2", Pawn.new(:white))
    @board.set_piece("D2", Pawn.new(:white))
    @board.set_piece("E2", Pawn.new(:white))
    @board.set_piece("F2", Pawn.new(:white))
    @board.set_piece("G2", Pawn.new(:white))
    @board.set_piece("H2", Pawn.new(:white))

    @board.set_piece("A8", Rook.new(:black))
    @board.set_piece("B8", Knight.new(:black))
    @board.set_piece("C8", Bishop.new(:black))
    @board.set_piece("D8", Queen.new(:black))
    @board.set_piece("E8", King.new(:black))
    @board.set_piece("F8", Bishop.new(:black))
    @board.set_piece("G8", Knight.new(:black))
    @board.set_piece("H8", Rook.new(:black))
    @board.set_piece("A7", Pawn.new(:black))
    @board.set_piece("B7", Pawn.new(:black))
    @board.set_piece("C7", Pawn.new(:black))
    @board.set_piece("D7", Pawn.new(:black))
    @board.set_piece("E7", Pawn.new(:black))
    @board.set_piece("F7", Pawn.new(:black))
    @board.set_piece("G7", Pawn.new(:black))
    @board.set_piece("H7", Pawn.new(:black))
  end

  def player_turn(player)
  # loop until valid user input
  #   user inputs a Square (of piece to move)
  #   piece_to_move = @board.get_piece_to_move(Square, Player): return nil (if empty square or opponent's piece), return Piece
  #   break if ! piece_to_move.nil?
  # end loop
  # valid_moves = piece_to_move.valid_moves
  end

  def play
    # while !winner && !stalemate
    #   player_turn(the_next_player)
    # end
  end

end
