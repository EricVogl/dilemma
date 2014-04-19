#!/usr/bin/ruby

require "./processor.rb"
require "./strategy.rb"

opponentName = ""
if (ARGV.length > 0)
  opponentName = ARGV[0].chomp
end

strategy = Strategy.new(opponentName)
processor = Processor.new(strategy)
processor.process
