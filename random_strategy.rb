require_relative "strategy"

class RandomStrategy < Strategy
  register "random"

  def initialize(opponentName)
    super(opponentName)
  end

  def doTurn
    return getRandomMove
  end
end
