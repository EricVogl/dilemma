#!/usr/bin/ruby

require_relative "processor"
require_relative "strategy"
require_relative "random_strategy"
require_relative "sabotage_strategy"
require_relative "cooperate_strategy"

opponentName = ""
if (ARGV.length > 0)
  opponentName = ARGV[0].chomp
end

strategy = Strategy.new(opponentName)
if (ARGV.length > 1)
  case (ARGV[1])
    when "sabotage"
      strategy = SabotageStrategy.new(opponentName)
    when "coop"
      strategy = CooperateStrategy.new(opponentName)
    when "random"
      strategy = RandomStrategy.new(opponentName)
  end
end

processor = Processor.new(strategy)
processor.process
