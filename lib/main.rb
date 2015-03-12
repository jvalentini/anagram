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
  attr_reader :anagrams

  def initialize(words)
    super
    @index = index_anagrams(self.words)
  end

  def find(word)
    self.index[indexed_word(word)]
  end

  private

  def indexed_word(word)
    word.chars.sort.join.to_sym
  end

  def index_anagrams(words)
    index = Hash.new { |hash, key| hash[key] = [] }
    @anagrams = Hash.new { |hash, key| hash[key] = [] }

    words.map do |word|
      indexed_word = indexed_word(word)

      if index.has_key?(indexed_word)
        @anagrams[indexed_word] = index[indexed_word].clone
        @anagrams[indexed_word] << word
      end

      index[indexed_word] << word
    end

    index
  end
end
