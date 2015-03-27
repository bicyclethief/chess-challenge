require_relative 'coordinate'
require_relative 'notation'

class Square
  include Notation

  attr_accessor :column, :row

  def initialize(column = nil, row = nil)
    @column = column # letter
    @row = row # number
  end

  def add_row(row)
    coordinate = to_grid_notation(self)
    coordinate.column += row
    new_square = self.to_chess_notation(coordinate)
    @column = new_square.column
    @row = new_square.row
  end

  def add_column(column)
    coordinate = to_grid_notation(self)
    coordinate.row -= column
    new_square = self.to_chess_notation(coordinate)
    @column = new_square.column
    @row = new_square.row
  end

  def equal?(square)
    self.column == square.column && self.row == square.row
  end
end