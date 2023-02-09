require './lib/most_common_word_sequences_of_file'

class CommonWordSequencesMultiFiles
  def call
    ARGV.each { |file_name|
      begin
        file = File.open(file_name)
        MostCommonWordSequencesOfFile.new(file).call
        file.close()
      rescue
        print "#{file_name} does not exist. proceeding..."
      end
    }
  end
end

print CommonWordSequencesMultiFiles.new.call