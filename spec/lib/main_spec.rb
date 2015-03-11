require 'main'

RSpec.describe Dictionary do
  subject { Dictionary.new(['cat', 'tac', 'foo', 'act', 'bar']) }

  context '.new' do
    it 'indexes words from a dictionary file' do
      expect(subject.words.count).to be > 0
    end

    it 'removes trailing newlines' do
      expect(subject.words[0]).to eq(subject.words[0].strip)
    end
  end

  context '.create_from_file' do
    it { expect(subject.words.count).to be > 0 }
  end

end
