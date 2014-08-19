require 'unhash'

describe Unhash do
  let(:letters) { 'acdegilmnoprstuw' }

  subject { described_class.new(letters) }

  describe '#unhash!' do
    let(:hash) { 680_131_659_347 }
    let(:expected) { 'leepadg' }

    it 'unhashes the received hash' do
      subject.unhash!(hash, 7)
      expect(subject.value).to be_eql(expected)
    end
  end
end
