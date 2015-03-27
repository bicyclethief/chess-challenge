require_relative 'board'
require_relative 'coordinate'
require_relative 'notation'
require_relative 'game'
require_relative 'king'
require_relative 'piece'
require_relative 'rook'
require_relative 'bishop'

class Square
  include Notation

  attr_accessor :column, :row

  def initialize(column = nil, row = nil)
    @column = column
    @row = row
  end

  def add_row(row)
    @row += row
  end

  def add_column(column)
    coordinate = to_grid_notation(self)
    coordinate.column += column
    new_square = to_chess_notation(coordinate)
    @column = new_square.column
    @row = new_square.row
  end
end