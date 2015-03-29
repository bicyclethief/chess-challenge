
class Player

  attr_accessor :name
  attr_reader :piece

  def initialize(name = nil, piece = nil)
    @name = name
    @piece = piece
  end
end