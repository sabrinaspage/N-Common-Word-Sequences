class MostCommonWordSequences
  NUM_OF_WORDS_IN_SEQUENCE = 3
  NUM_OF_SEQUENCES = 100

  def initialize(file)
    @file = file
  end

  def call
    data = word_sequence_frequencies(strip)
    hash = descend(data)
    top_common_word_sequences(hash)
  end

  def strip
    file_data = @file.read.downcase.split()
    file_data.map!{|data| data.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '') }
    file_data.map!{|data| data.gsub(/[?"]/, '') }
  end

  def word_sequence_frequencies(file_data)
    frequency_dict = Hash.new

    for i in 0..file_data.length-NUM_OF_WORDS_IN_SEQUENCE do
      next if file_data[i] == '' || file_data[i+1] == '' || file_data[i+2] == ''

      three_word_seq = "#{file_data[i]} #{file_data[i+1]} #{file_data[i+2]}"
      if frequency_dict.has_key?(three_word_seq)
        frequency_dict[three_word_seq] += 1
      else
        frequency_dict[three_word_seq] ||= 0
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