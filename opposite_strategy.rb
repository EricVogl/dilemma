require_relative "strategy"

class OppositeStrategy < Strategy
  register "opposite"

  def initialize(opponentName)
    super(opponentName)
    @rnd = Random.new
    @last = getRandomMove
  end

  def doTurn
    return getOpposite
  end

  def opponentCooperate
    @last = "C"
  end

  def opponentSabotage
    @last = "S"
  end

private
  def getOpposite
    if ("C" == @last)
      return "S"
    end
    return "C"
  end

end
