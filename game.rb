require_relative 'square'
require_relative 'coordinate'
require_relative 'player'
require_relative 'rook'
require_relative 'queen'
require_relative 'king'
require_relative 'bishop'
require_relative 'pawn'
require_relative 'notation'
require_relative 'board'
require_relative 'piece'
require_relative 'move'


class Game

  attr_reader :players, :view
  attr_accessor :board

  # player1 & player2 are Player objects
  def initialize(args)
    @players = []
    @players << args[:player1] if !args[:player1].nil?
    @players << args[:player2] if !args[:player2].nil?
    @board = Board.new
    @board = args[:board]
    @board ||= Board.new
    @view = View.new
    @moves = []
  end

  # creates and places pieces on board for a standard game of Chess
  def place_pieces
    board.place_piece(Square.new('a',1), Rook.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('b',1), Knight.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('c',1), Bishop.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('d',1), Queen.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('e',1), King.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('f',1), Bishop.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('g',1), Knight.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('h',1), Rook.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('a',2), Pawn.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('b',2), Pawn.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('c',2), Pawn.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('d',2), Pawn.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('e',2), Pawn.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('f',2), Pawn.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('g',2), Pawn.new(Piece::COLOR_WHITE))
    board.place_piece(Square.new('h',2), Pawn.new(Piece::COLOR_WHITE))

    board.place_piece(Square.new('a',8), Rook.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('b',8), Knight.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('c',8), Bishop.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('d',8), Queen.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('e',8), King.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('f',8), Bishop.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('g',8), Knight.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('h',8), Rook.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('a',7), Pawn.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('b',7), Pawn.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('c',7), Pawn.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('d',7), Pawn.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('e',7), Pawn.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('f',7), Pawn.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('g',7), Pawn.new(Piece::COLOR_BLACK))
    board.place_piece(Square.new('h',7), Pawn.new(Piece::COLOR_BLACK))
  end


  def player_turn(player)
    loop do
      view.turn(player.name)
      origin = gets.chomp
      origin_square = Square.new(origin[0], origin[1])
      origin_content = board.moves(origin_square)
      break if ! origin_content.nil?
    end

    captured = board.move_piece(origin_square)
  end

  def play
    place_pieces

    players.each do |player|
      puts board
      player_turn(player)
    end
  end
end

class View
  def turn(player)
    puts "#{player}'s turn."
    print "#{player}, your move? "
  end

  def moves_for(color, piece, square, moves)
    puts "moves for #{color} #{piece} #{square}: #{moves}"
  end

  def where(player, square)
    print "#{player}, move #{square} where? "
  end

  def moved(player, piece, start, finish, checkmate)
    checkmate_txt = checkmate ? " Checkmate." : ""
    puts "\nOk, #{player}'s #{piece} #{start} to #{finish}.#{checkmate_txt}"
  end

  def captures(player1, piece1, start, player2, piece2, finish, checkmate)
    checkmate_txt = checkmate ? " Checkmate." : ""
    puts "\nOk, #{player1}'s #{piece} #{start} captures #{player1}'s #{piece} #{start} #{finish}.#{checkmate}"
  end
end

player1 = Player.new('white')
player2 = Player.new('black')
game = Game.new({:player1 => player1, :player2 => player2})
game.play

