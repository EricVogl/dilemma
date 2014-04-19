require_relative "strategy"

class SuperJerkStrategy < Strategy
  register "superjerk"
  @@move_count_before_coop = 50

  def initialize(opponentName)
    super(opponentName)
    @turnCount = 0
  end

  def doTurn
    @turnCount = @turnCount + 1
    if (@turnCount >= @@move_count_before_coop)
      x = Random.rand(1..20)
      if (x == 1)
        return "C"
      end
    end
    return "S"
  end

  def opponentCooperate
  end

  def opponentSabotage
  end

end
