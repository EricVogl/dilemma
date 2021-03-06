require_relative "strategy"

class Processor
  def initialize(strategy)
    @strategy = strategy
  end

  def process
    until ((input = $stdin.gets.chomp) == "quit")
      if (input == "turn")
        processTurn
      elsif
        raise "Unexpected input: '#{input}'"
      end
    end
  end

  private
  def processTurn
    turn = @strategy.doTurn
    $stdout.puts turn
    $stdout.flush
    input = $stdin.gets.chomp

    if (input == "C")
      @strategy.opponentCooperate
    elsif (input == "S")
      @strategy.opponentSabotage
    elsif
      raise "Expected enemy turn.  Unexpected input: '#{input}'"
    end
  end
end
