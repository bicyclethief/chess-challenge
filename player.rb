
class Player

  attr_accessor :name

  def initialize(name=nil, piece=nil)
    @name = name
    @piece = piece
  end
end