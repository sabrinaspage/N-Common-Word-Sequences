class MostCommonWordSequencesOfFile
  attr_writer :result
  NUM_OF_WORDS_IN_SEQUENCE = 3
  NUM_OF_SEQUENCES = 100

  def initialize(file)
    @file = file
    @result = nil
  end

  def call
    strip
    word_sequence_frequencies
    descend
    top_common_word_sequences
    print_top_word_sequences
  end

  def print_top_word_sequences
    print @result.keys
  end

  def strip
    file_data = @file.read.downcase.split()
    @result = file_data.map!{|data| data.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '')}.reject(&:empty?)
  end

  def word_seq(index)
    @result[index..index + NUM_OF_WORDS_IN_SEQUENCE - 1].join(' ')
  end

  def word_sequence_frequencies
    frequency_dict = Hash.new(0)

    for i in 0..@result.length-NUM_OF_WORDS_IN_SEQUENCE do
      word_sequence = word_seq(i)
      frequency_dict[word_sequence] += 1
    end

    @result = frequency_dict
  end

  def descend
    @result = Hash[@result.sort_by{|k,v| -v}]
  end

  def top_common_word_sequences
    @result = Hash[@result.take(NUM_OF_SEQUENCES)]
  end
end