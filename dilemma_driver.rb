#!/usr/bin/env ruby

require 'open3'

$driver_pts = 0
$prog_pts = 0
$all_sab = true

def do_rounds(round, p_in, p_out)
  1.upto(round) do |i|
    puts "< turn"
    p_in.puts "turn"

    i = p_out.gets.chomp
    puts "> #{i}"

    o = (rand(1..2) == 1 ? "C" : "S")
    puts "< #{o}"
    p_in.puts o

    if (i == "C" && o == "C")
      $driver_pts += 2
      $prog_pts += 2
      $all_sab = false
    elsif (i == "S" && o == "S")
      $driver_pts += 1
      $prog_pts += 1
    elsif (i == "C")
      $driver_pts += 3
      $prog_pts += 0
      $all_sab = false
    else
      $driver_pts += 0
      $prog_pts += 3
    end
  end
end

puts "Simple Driver program - Dilemma"

if (ARGV.length == 0)
  puts "usage: dilemma_driver.rb command"
  exit
end

puts "Starting program #{ARGV[0]} dilemma_driver"
Open3.popen3("#{ARGV[0]} dilemma_driver") do |p_in, p_out, p_err|
  round = rand(25..75)
  puts "Running #{round} rounds"
  do_rounds(round, p_in, p_out)

  puts "Driver Program scored #{$driver_pts}"
  puts "User Program scored #{$prog_pts}"

  while ($driver_pts == $prog_pts)
    round = rand(10..20)
    puts "Tie game - Tie breaker - #{round} rounds"
    $all_sab = true
    do_rounds(round, p_in, p_out)

    puts "Driver Program scored #{$driver_pts}"
    puts "User Program scored #{$prog_pts}"

    if ($all_sab)
      puts "User program sabotaged ALL tie rounds. User loses."
      exit
    end
  end
  p_in.puts "quit"

  if ($driver_pts > $prog_pts)
    puts "Driver program wins."
  else
    puts "User program wins."
  end
end

