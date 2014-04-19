#!/usr/bin/ruby

class Strategy
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
end

class Processor
  def initialize(strategy)
    @strategy = strategy
  end

  def process
    until ((input = STDIN.gets.chomp) == "quit")
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
    STDOUT.puts turn
    input = STDIN.gets.chomp

    if (input == "C")
      @strategy.opponentCooperate
    elsif (input == "S")
      @strategy.opponentSabotage
    elsif
      raise "Expected enemy turn.  Unexpected input: '#{input}'"
    end
  end
end

opponentName = ""
if (ARGV.length > 0)
  opponentName = ARGV[0].chomp
end

strategy = Strategy.new(opponentName)
processor = Processor.new(strategy)
processor.process
