
class View
  def turn(player)
    puts "#{player}'s turn."
    print "#{player}, your move? "
  end

  def moves_for(player, piece, square, moves)
    puts "moves for #{player} #{piece} #{square}: #{moves}"
  end

  def where(player, square)
    print "#{player}, move #{square} where? "
  end

  def moved(player, piece, origin, destination, checkmate = nil)
    checkmate_txt = checkmate ? " Checkmate." : ""
    puts "\nOk, #{player}'s #{piece} #{origin} to #{destination}.#{checkmate_txt}"
  end

  def captures(player1, piece1, origin, player2, piece2, destination, checkmate = nil)
    checkmate_txt = checkmate ? " Checkmate." : ""
    puts "\nOk, #{player1}'s #{piece} #{origin} captures #{player1}'s #{piece2} #{destination}.#{checkmate}"
  end
end