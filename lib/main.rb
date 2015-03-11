class Dictionary
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def self.create_from_file(path)
    words = []

    File.open(path) do |f|
      f.each_line do |line|
        words << line.strip
      end
    end

    self.new(words)
  end
end

class AnagramDictionary < Dictionary
  attr_reader :index

  def initialize(words)
    @words = index_anagrams(words)
    @index = self.words
  end

  private

  def index_anagrams(words)
    words = words.map do |word|
      word.chars.sort.join
    end.sort
  end
end
