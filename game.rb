# Controller

class Game

  attr_reader :player1, :player2
  attr_accessor :board

  # player1 & player2 are Player objects
  def initialize(args)
    @player1 = args[:player1]
    @player2 = args[:player2]
    @colors = [:white, :black].shuffle!
    @players = {@player1 => @colors[0],
                @player2 => @colors[1]
                }

    @board = args[:board]
  end

  # creates and places pieces on board for a standard game of Chess
  def set_all_pieces(pieces)
    @board.set_piece("A1", Rook.new())
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
