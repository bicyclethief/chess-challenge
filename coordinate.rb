require_relative 'square'

class Coordinate

  attr_accessor :column, :row

  def initialize(row = nil, column = nil)
    @column = column
    @row = row
  end
end