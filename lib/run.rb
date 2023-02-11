# frozen_string_literal: true

require './lib/main'

time_start = Time.now
Main.new(ARGV).call.each_with_index { |hash, index|
  print ARGV[index], "\n"
  pp hash
}
time_end = Time.now
puts "Time: #{(time_end - time_start)} seconds"