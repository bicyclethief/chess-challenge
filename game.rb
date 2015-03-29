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
require_relative 'view'


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

  def play
    place_pieces

    until board.checkmate?
      players.each do |player|
        puts board
        player_turn(player, get_opponent(player))
      end
    end
  end

  def promotion?(origin_piece, destination_square)
    origin_piece.class == Pawn && (destination_square.row == 1 || destination_square.row == 8)
  end

  private

  def get_opponent(player)
    players.find { |person| person != player }
  end

  def player_turn(player, opponent)
    origin_square = nil
    origin_piece = nil
    destination_square = nil
    legal_moves = nil

    loop do
      view.turn(player.name)
      origin = gets.chomp.downcase

      # TODO: validate user input before assuming it's 2 characters
      origin_square = Square.new(origin[0], origin[1].to_i)
      origin_piece = board.get_square_content(origin_square)

      if !origin_piece.nil? && player_own_piece?(player, origin_piece)
        legal_moves = origin_piece.legal_moves(origin_square, board)
        break if ! legal_moves.empty?
      end
      # TODO: display a "please input a valid square with one of your pieces on it" msg here
    end

    view.moves_for(player.name, origin_piece.name, origin_square.to_s, moves_to_s(legal_moves))

    loop do
      view.where(player.name, origin_square.to_s)
      destination = gets.chomp.downcase
      # TODO: validate user input before assuming it's 2 characters
      destination_square = Square.new(destination[0], destination[1].to_i)

      # pawn promotion
      if promotion?(origin_piece, destination_square)
        new_piece = ""
        until new_piece == "rook" || new_piece == "bishop" || new_piece == "queen" || new_piece == "knight"
          view.promote_pawn(player)
          new_piece = gets.chomp.downcase
        end
        board.promote(destination_square, player, origin_piece, new_piece)
      end

      break if in_legal_moves?(destination_square, legal_moves)
      # TODO: display "please select a move from the list" msg here
    end

    captured_piece = board.move_piece(origin_square, destination_square)

    if captured_piece.nil?
      view.moved(player.name, origin_piece.name, origin_square.to_s, destination_square.to_s)
    else
      view.captures(player.name, origin_piece.name, origin_square.to_s, opponent.name, captured_piece.name, destination_square)
    end
  end

  def moves_to_s(squares)
    squares = squares.map do |square|
      square.to_s
    end.join(", ")
  end

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

  def player_own_piece?(player, piece)
    player.piece.color == piece.color
  end

  def in_legal_moves?(destination_square, legal_moves)
    legal_moves.any? do |square|
        square.equal?(destination_square)
    end
  end

end


player1 = Player.new('white', Piece.new(Piece::COLOR_WHITE))
player2 = Player.new('black', Piece.new(Piece::COLOR_BLACK))
game = Game.new({:player1 => player1, :player2 => player2})
game.play

