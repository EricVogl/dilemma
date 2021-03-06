require_relative "strategy"

class SameStrategy < Strategy
  register "same"

  def initialize(opponentName)
    super(opponentName)
    @last = getRandomMove
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
end
