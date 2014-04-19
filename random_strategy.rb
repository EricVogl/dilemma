require "./strategy.rb"

class RandomStrategy < Strategy
  def doTurn
    choice = Random.rand(1)
    case choice
      when 0
        return "C"
      when 1
        return "S"
    end
  end
end
