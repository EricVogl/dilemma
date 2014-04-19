require_relative "strategy"

class PavlovStrategy < Strategy
  register "pavlov"

  def initialize(opponentName)
    super(opponentName)
    @opponentLast = "C"
    @myLast = "C"
  end

  def doTurn

    if (@myLast == @opponentLast)
      @myLast = "C"
      return "C"
    else
      @myLast = "S"
      return "S"
    end
  end

  def opponentCooperate
    @opponentLast = "C"
  end

  def opponentSabotage
    @opponentLast = "S"
  end

private
  def getOpposite
    if ("C" == @last)
      return "S"
    end
    return "C"
  end

end
