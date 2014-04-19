class Strategy
  def initialize(opponentName)
    @opponentName = opponentName
  end

  def doTurn
    return "C"
  end

  def opponentCooperate
  end

  def opponentSabotage
  end
end
