require_relative "strategy"

class SameStrategy < Strategy
  register "same"

  def initialize(opponentName)
    super(opponentName)
    @rnd = Random.new
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

private
  def getRandomMove
    choice = @rnd.rand(0..1)
    case choice
      when 0
        return "C"
      when 1
        return "S"
    end
  end
end
