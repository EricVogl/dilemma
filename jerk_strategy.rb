require_relative "strategy"

class JerkStrategy < Strategy
  register "jerk"
  @@history_lookback = 10

  def initialize(opponentName)
    super(opponentName)
    @myMoves = []
    @theirMoves = []
  end

  def doTurn
    prob = @@history_lookback
    move = "S"
    @myMoves.last([@@history_lookback, @myMoves.length].min).each { |elem|
      prob = prob - (elem == "S" ? 1 : 0)
      }
    if (Random.rand(1..@@history_lookback) > prob)
      move = "C"
    end
    @myMoves.push(move)
    return move
  end

  def opponentCooperate
    @theirMoves.push("C")
  end

  def opponentSabotage
    @theirMoves.push("S")
  end

end
