require_relative "strategy"

class TitForTatStrategy < Strategy
  register "titfortat"

  def initialize(opponentName)
    super(opponentName)
    @last = "C"
  end

  def doTurn
    return @last
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
