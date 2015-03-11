require 'main'

RSpec.describe Dictionary do
  subject { Dictionary.new('american-english') }

  context '.new' do
    it 'indexes words from a dictionary file' do
      expect(subject.word_count).to be > 0
    end
  end
end
