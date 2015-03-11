require 'main'

RSpec.describe Dictionary do
  subject { Dictionary.new(['cat', 'bar', 'act']) }

  context '.words' do
    it 'indexes words from a dictionary file' do
      expect(subject.words.count).to be 3
    end

    it 'sorts the words alphabetically' do
      expect(subject.words).to eq(['act', 'bar', 'cat'])
    end
  end

  context '.create_from_file' do
    subject { Dictionary.create_from_file('resources/test_dict.txt') }

    it { expect(subject.words.count).to be > 0 }

    it 'removes trailing newlines' do
      expect(subject.words[0]).to eq(subject.words[0].strip)
    end
  end
end

RSpec.describe AnagramDictionary do
  subject { AnagramDictionary.new(['cat', 'bar', 'act']) }

  context '.words' do
    it 'sorts the words alphabetically and not the characters' do
      expect(subject.words).to eq(['act', 'bar', 'cat'])
    end
  end

  context '.index' do
    it 'sorts each character within the indexed word alphabetically' do
      expect(AnagramDictionary.new(['bar']).index).to eq({ abr: ['bar'] })
    end

    it 'creates an index mapping a sorted-char word to its original word' do
      expect(subject.index).to eq({ abr: ['bar'], act: ['act', 'cat'] })
    end
  end

  context '.find' do
    it 'finds an anagram' do
      expect(subject.find('rab')).to eq(['bar'])
    end

    it 'finds multiple anagrams' do
      expect(subject.find('cat')).to eq(['act', 'cat'])
      expect(subject.find('tac')).to eq(['act', 'cat'])
    end
  end
end
