# frozen_string_literal: true

require './lib/main'

Main.new(ARGV).call.each_with_index { |hash, index|
  print ARGV[index], "\n"
  pp hash
}