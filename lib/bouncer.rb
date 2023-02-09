class Bouncer
  def bounce(wow)
    !!(wow == 'xx')
  end
end

# get all the most common word sequences
# descend them in order of frequency
# return the top 100

file_name = ARGV[-1]

file = File.open(file_name)
file_data = file.read.downcase.split()
file_data.map!{|data| data.gsub(/[!@#$%^&*()-=_+|;':",.<>?']/, '') }
file_data.map!{|data| data.gsub(/[?"]/, '') }


def most_common_word_sequences(file_data)
  frequency_dict = Hash.new

  for i in 0..file_data.length-3 do
    next if file_data[i] == '' || file_data[i+1] == '' || file_data[i+2] == ''

    three_word_seq = "#{file_data[i]} #{file_data[i+1]} #{file_data[i+2]}"
    if frequency_dict.has_key?(three_word_seq)
      frequency_dict[three_word_seq] += 1
    else
      frequency_dict[three_word_seq] ||= 0
    end
  end

  frequency_dict.sort_by {|k, v| -v}.take(100)
end

print most_common_word_sequences(file_data)