require_relative "strategy"

class SabotageStrategy < Strategy
  register "sabotage"

  def doTurn
    return "S"
  end
end
