require 'main'

RSpec.describe Dictionary do
  subject { Dictionary.new(['cat', 'tac', 'foo', 'act', 'bar']) }

  context '.new' do
    it 'indexes words from a dictionary file' do
      expect(subject.words.count).to be > 0
    end
  end

  context '.create_from_file' do
    it { expect(subject.words.count).to be > 0 }

    it 'removes trailing newlines' do
      expect(subject.words[0]).to eq(subject.words[0].strip)
    end
  end

  context '.index_anagrams' do
    it 'sorts the words alphabetically' do
      expect(subject.index_anagrams).to start_with("act")
    end

    it 'sorts each character within a word alphabetically' do
      expect(subject.index_anagrams()[0]).to eq('act')
    end
  end
end
