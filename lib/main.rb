require './lib/most_common_word_sequences_of_file'

class Main
  def call
    ARGV.each { |file_name|
      begin
        return "Please only enter .txt files" unless file_name.end_with?('.txt')
        file = File.open(file_name)
        result = MostCommonWordSequencesOfFile.new(file).call
        file.close()
      rescue NoMethodError
        raise
      # rescue
      #   print "#{file_name} does not exist. proceeding..."
      end
    }
  end
end

Main.new.call