require_relative 'board'
require_relative 'notation'
require_relative 'game'
require_relative 'king'
require_relative 'piece'
require_relative 'rook'
require_relative 'square'
require_relative 'bishop'

class Coordinate

  include Notation

  attr_accessor :column, :row

  def initialize(row = nil, column = nil)
    @column = column
    @row = row
  end
end