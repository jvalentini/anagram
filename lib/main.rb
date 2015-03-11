class Dictionary
  attr_reader :words

  def initialize(words)
    @words = words.sort
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
    super
    @index = index_anagrams(self.words)
  end

  private

  def index_anagrams(words)
    index = Hash.new { |hash, key| hash[key] = [] }

    words.map do |word|
      index[word.chars.sort.join.to_sym] << word
    end

    index
  end
end
