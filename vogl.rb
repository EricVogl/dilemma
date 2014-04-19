#!/usr/bin/env ruby

require_relative "processor"
require_relative "strategy"
require_relative "random_strategy"
require_relative "opposite_strategy"
require_relative "same_strategy"
require_relative "sabotage_strategy"
require_relative "cooperate_strategy"
require_relative "pavlov_strategy"
require_relative "tit_for_tat_strategy"
require_relative "jerk_strategy"
require_relative "super_jerk_strategy"

opponentName = ""
if (ARGV.length > 0)
  opponentName = ARGV[0].chomp
end

strategy = Strategy.any(opponentName)
if (ARGV.length > 1)
  strategy = Strategy.of(ARGV[1], opponentName)
end

processor = Processor.new(strategy)
processor.process
