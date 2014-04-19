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

  def getRandomMove
    choice = Random.rand(0..1)
    case choice
      when 0
        return "C"
      when 1
        return "S"
    end
  end

  def self.register(className)
    @@strategies[className] = self
  end

  def self.of(className, opponentName)
    return @@strategies[className].new(opponentName)
  end

  def self.any(opponentName)
    keys = @@strategies.keys
    index = Random.rand(0..keys.length - 1)
    return @@strategies[keys.at(index)].new(opponentName)
  end
end
