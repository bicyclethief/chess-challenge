require_relative 'bishop'
require_relative 'king'
require_relative 'rook'
require_relative 'knight'
require_relative 'notation'
require_relative 'coordinate'
require_relative 'piece'
require_relative 'square'

class Board

  attr_reader :board, :move_history

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @move_history = []
  end

  def move_piece(origin_square, destination_square)
    return nil if out_of_bounds?(origin_square) || out_of_bounds?(destination_square)
    origin_piece = at(origin_square)
    destination_piece = at(destination_square)
    set(origin_square, nil)
    set(destination_square, origin_piece)
    origin_piece.set_moved
    add_to_move_history(origin_square, destination_square, origin_piece)
    destination_piece
  end

  def place_piece(square, piece)
    return nil if out_of_bounds?(square)
    return nil if piece.nil?
    set(square, piece)
  end

  def out_of_bounds?(square)
    !Notation::LETTERS.include?(square.column) || !Notation::INDEX_TO_RANK.include?(square.row)
  end

  def each_square_with_content
    board.each_with_index do |row, row_index|
      row.each_with_index do |content, col_index|
        square = Notation::to_chess_notation(Coordinate.new(row_index, col_index))
        yield(square, content)
      end
    end
  end

  def get_square_content(square)
    return nil if out_of_bounds?(square)
    at(square)
  end

  def to_s
    board_str = board.each_with_index.map do |row, row_index|
      row_label = Notation.to_chess_notation(Square.new(0, row_index)).row
      board_row = row.each_with_index.map do |content, col_index|
        (content.nil?) ? " " : content.to_s
      end
      "#{row_label} #{board_row.join(' ')}"
    end.join("\n")

    "#{board_str}\n  #{Notation::LETTERS.join(' ')}"
  end

  def checkmate?
    one_king_left?
  end

  def stalemate?
    # TODO: implement
    return false
  end

  def add_to_move_history(origin_square, destination_square, origin_piece)
    @move_history << [origin_square, destination_square, origin_piece]
  end

  private

  def at(square)
    coordinate = Notation.to_grid_notation(square)
    board[coordinate.row][coordinate.column]
  end

  def set(square, piece)
    coordinate = Notation.to_grid_notation(square)
    @board[coordinate.row][coordinate.column] = piece
  end

  def one_king_left?
    king_count = 0
    self.each_square_with_content do |square, content|
      if !content.nil? && content.class == King
        king_count += 1
      end
    end
    return true if king_count < 2
  end
end

