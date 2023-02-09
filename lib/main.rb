class MostCommonWordSequences
  NUM_OF_WORDS_IN_SEQUENCE = 3
  NUM_OF_SEQUENCES = 100

  def initialize(file)
    @file = file
  end

  def call
    freq = word_sequence_frequencies(strip)
    hash = descend(freq)
    top_common_word_sequences(hash)
  end

  def strip
    file_data = @file.read.downcase.split()
    file_data.map!{|data| data.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '') }
  end

  def sequence_has_empty_strings(data, index)
    data[index..index + NUM_OF_WORDS_IN_SEQUENCE - 1].any?(&:empty?)
  end

  def word_seq(data, index)
    data[index..index + NUM_OF_WORDS_IN_SEQUENCE - 1].join(' ')
  end

  def word_sequence_frequencies(file_data)
    frequency_dict = Hash.new

    for i in 0..file_data.length-NUM_OF_WORDS_IN_SEQUENCE do
      next if sequence_has_empty_strings(file_data, i)

      word_sequence = word_seq(file_data, i)

      if frequency_dict.has_key?(word_sequence)
        frequency_dict[word_sequence] += 1
      else
        frequency_dict[word_sequence] ||= 0
      end
    end

    frequency_dict
  end

  def descend(hash)
    hash.sort_by {|k, v| -v}
  end

  def top_common_word_sequences(hash)
    hash.take(NUM_OF_SEQUENCES)
  end
end

file_name = ARGV[-1]
file = File.open(file_name)
print MostCommonWordSequences.new(file).call