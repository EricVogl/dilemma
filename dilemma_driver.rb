#!/usr/bin/env ruby

require 'open3'

$p2_pts = 0
$p1_pts = 0
$all_sab1 = true
$all_sab2 = true
$tie_breaker_rounds = 0

def do_rounds(round, p_in1, p_out1, p_in2, p_out2)
  1.upto(round) do |i|
    puts "< turn"
    p_in1.puts "turn"
    p_in2.puts "turn"

    i1 = p_out1.gets.chomp
    puts "p1 > #{i1}"

    i2 = p_out2.gets.chomp
    puts "p2 > #{i2}"

    p_in1.puts i2
    p_in2.puts i1


    if (i1 == "C" && i2 == "C")
      $p1_pts += 2
      $p2_pts += 2
      $all_sab1 = false
      $all_sab2 = false
    elsif (i1 == "S" && i2 == "S")
      $p1_pts += 1
      $p2_pts += 1
    elsif (i1 == "C")
      $p2_pts += 3
      $p1_pts += 0
      $all_sab1 = false
    else
      $p2_pts += 0
      $p1_pts += 3
      $all_sab2 = false
    end
  end
end

puts "Simple Driver program - Dilemma"

if (ARGV.length != 4)
  puts "usage: dilemma_driver.rb command1 name1 command2 name2"
  exit
end

puts "Starting program #{ARGV[0]} #{ARGV[3]}"
Open3.popen3("#{ARGV[0]} #{ARGV[3]}") do |p_in1, p_out1, p_err1|
  puts "Starting program #{ARGV[2]} #{ARGV[1]}"
  Open3.popen3("#{ARGV[2]} #{ARGV[1]}") do |p_in2, p_out2, p_err2|
    round = rand(25..75)
    puts "Running #{round} rounds"
    do_rounds(round, p_in1, p_out1, p_in2, p_out2)

    puts "#{ARGV[1]} Program scored #{$p1_pts}"
    puts "#{ARGV[3]} Program scored #{$p2_pts}"

    while (($p1_pts == $p2_pts) and ($tie_breaker_rounds < 3))
      round = rand(10..20)
      puts "Tie game - Tie breaker - #{round} rounds"
      $all_sab = true
      do_rounds(round, p_in1, p_out1, p_in2, p_out2)

      puts "#{ARGV[1]} Program scored #{$p1_pts}"
      puts "#{ARGV[3]} Program scored #{$p2_pts}"

      if ($all_sab1)
        puts "#{ARGV[1]} program sabotaged ALL tie rounds."
        $p1_pts = 0
      end
      if ($all_sab2)
        puts "#{ARGV[3]} program sabotaged ALL tie rounds."
        $p2_pts = 0
      end
      $tie_breaker_rounds = $tie_breaker_rounds + 1
    end
    p_in1.puts "quit"
    p_in2.puts "quit"

    if (($p1_pts == 0 and $p2_pts == 0) or (($p1_pts == $p2_pts) and $tie_breaker_rounds >= 3))
      puts "Both lose"
    elsif ($p1_pts > $p2_pts)
      puts "#{ARGV[1]} program wins."
    else
      puts "#{ARGV[3]} program wins."
    end
  end
end

