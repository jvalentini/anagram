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

  def index_anagrams
    words = self.words.map do |word|
      word.chars.sort.join
    end.sort

    Dictionary.new(words)
  end
end
