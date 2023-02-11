# frozen_string_literal: true
require "pry"

class MostCommonWordSequencesOfFile
  attr_writer :result

  NUM_OF_WORDS_IN_SEQUENCE = 3
  NUM_OF_SEQUENCES = 100

  def initialize(file)
    @file = file
    @file_data = []
    @result = {}
  end

  def call
    strip_file
    word_sequence_frequencies
    descend
    top_common_word_sequences
  end

  private

  def strip_file
    @file_data = @file.read.downcase.split
    @file_data.map! { |data| data.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '') }.reject!(&:empty?)
  end

  def word_seq(index)
    @file_data[index..index + NUM_OF_WORDS_IN_SEQUENCE - 1].join(' ')
  end

  def word_sequence_frequencies
    frequency_dict = Hash.new(0)

    (0..@file_data.length - NUM_OF_WORDS_IN_SEQUENCE).each do |i|
      word_sequence = word_seq(i)
      frequency_dict[word_sequence] += 1
    end

    @result = frequency_dict
  end

  def descend
    @result = Hash[@result.sort_by { |_k, v| -v }]
  end

  def top_common_word_sequences
    @result = Hash[@result.take(NUM_OF_SEQUENCES)]
  end
end
