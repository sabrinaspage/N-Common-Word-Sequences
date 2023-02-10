require './lib/most_common_word_sequences_of_file'

class Main
  attr_writer :result
  def initialize(file_names)
    @file_names = file_names
    @result = []
  end

  def call
    @file_names.map { |file_name|
      begin
        unless file_name.end_with?('.txt')
          next
        end
        file = File.open(file_name)
        @result << MostCommonWordSequencesOfFile.new(file).call
        file.close()
      rescue Errno::ENOENT
        print "#{file_name} does not exist. proceeding..."
      end
    }

    @result
  end
end