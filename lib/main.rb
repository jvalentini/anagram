def indexed_word(word)
  word.chars.sort.join.to_sym
end

def index_anagrams(words)
  index = Hash.new { |hash, key| hash[key] = [] }

  words.map do |word|
    index[indexed_word(word)] << word
  end

  index
end

def anagrams_from_index(index)
  anagrams = []

  index.each do |key, value|
    if value.count > 1
      anagrams << value
    end
  end

  anagrams
end

def parse_words_from_file(path)
  words = []

  File.open(path) do |f|
    f.each_line do |line|
      words << line.strip
    end
  end

  words
end

def find_anagrams_for_word(words, word)
  anagram_index = index_anagrams(words)
  anagram_index[indexed_word(word)]
end

def find_anagrams(words)
  anagrams_from_index(index_anagrams(words))
end

class Dictionary
  attr_reader :words

  def initialize(words)
    @words = words.sort
  end

  def self.create_from_file(path)
    self.new(parse_words_from_file(path))
  end
end

class AnagramDictionary < Dictionary
  attr_reader :index

  def initialize(words)
    super
    @index = index_anagrams(self.words)
  end

  def find(word)
    find_anagrams_for_word(self.words, word)
  end

  def anagrams
    find_anagrams(self.words)
  end
end
