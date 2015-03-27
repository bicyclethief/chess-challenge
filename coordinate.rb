require_relative 'notation'

class Coordinate

  include Notation

  attr_accessor :column, :row

  def initialize(row = nil, column = nil)
    @column = column
    @row = row
  end
end