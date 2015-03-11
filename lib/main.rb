class Dictionary
  attr_accessor :words

  def initialize(path)
    self.words = []

    File.open(path) do |f|
      f.each_line do |line|
        self.words << line.strip
      end
    end
  end

  def word_count
    self.words.length
  end
end
