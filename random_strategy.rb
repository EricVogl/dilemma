require_relative "strategy"

class RandomStrategy < Strategy
  def initialize(opponentName)
    super(opponentName)
    @rnd = Random.new
  end
  def doTurn
    choice = @rnd.rand(0..1)
    case choice
      when 0
        return "C"
      when 1
        return "S"
    end
  end
end
