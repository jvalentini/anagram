class Dictionary
  attr_accessor :words

  def initialize(words)
    self.words = words
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
    self.words = self.words.map do |word|
      word.chars.sort.join
    end.sort!
  end
end
