# frozen_string_literal: true

require './lib/most_common_word_sequences_of_file'
require './tools/time'

class Main
  attr_writer :result

  def initialize(file_names)
    @file_names = file_names
    @result = []
  end

  def call
    run_all_files
    print_result
    @result
  end

  def output
    time_decorator(method(:call))
  end

  private

  def run_all_files
    @file_names.map do |file_name|
      next unless file_name.end_with?('.txt')

      file = File.open(file_name)
      @result << MostCommonWordSequencesOfFile.new(file).call
      file.close
    rescue Errno::ENOENT
      raise "#{file_name} does not exist. proceeding..."
    end
  end

  def print_result
    @result.each_with_index { |hash, index|
      puts @file_names[index]
      pp hash
    }
  end
end
