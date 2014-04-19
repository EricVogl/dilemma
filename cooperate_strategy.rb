require_relative "strategy"

class CooperateStrategy < Strategy
  register "cooperate"

  def doTurn
    return "C"
  end
end
