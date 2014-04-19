class Strategy
  @@strategies = {}

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

  def self.register(className)
    @@strategies[className] = self
  end

  def self.of(className, opponentName)
    @@strategies[className].new(opponentName)
  end
end
