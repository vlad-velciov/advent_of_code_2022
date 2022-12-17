# frozen_string_literal: true

describe Day13::PacketComparer do
  context 'simple one level integers lists' do
    it 'works if packets in right order' do
      packet_comparer = Day13::PacketComparer.new(%w([ 1 1 3 1 1 ]), %w([ 1 1 5 1 1 ]))
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'returns false for packets in wrong order' do
      packet_comparer = Day13::PacketComparer.new(%w([ 1 1 6 1 1 ]), %w([ 1 1 5 1 1 ]))
      expect(packet_comparer.compare_packets).to eq(false)
    end

    it 'returns false if the right packets ends earlier than the left one' do
      packet_comparer = Day13::PacketComparer.new(%w([ 1 1 3 1 1 ]), %w([ 1 1 5 1 ]))
      expect(packet_comparer.compare_packets).to eq(false)
    end

    it 'returns true if the left packet ends earlier than the left one' do
      packet_comparer = Day13::PacketComparer.new(%w([ 1 1 3 1 ]), %w([ 1 1 5 1 1 ]))
      expect(packet_comparer.compare_packets).to eq(true)
    end
  end

  context 'lists with same level structure' do
    it 'works if lists wrap everything' do
      packet_comparer = Day13::PacketComparer.new(%w([ [ 1 1 3 1 1 ] ]), %w([ [ 1 1 5 1 1 ] ]))
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'works if lists wrap the same number and place for both packets' do
      packet_comparer = Day13::PacketComparer.new(%w([ [ 1 1 3 ] 1 1 ]), %w([ [ 1 1 5 ] 1 1 ]))
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'works if there are multiple lists' do
      packet_comparer = Day13::PacketComparer.new(%w([ [ 1 1 3 ] 1 [ 1 ] ]), %w([ [ 1 1 5 ] 1 [ 1 ] ]))
      expect(packet_comparer.compare_packets).to eq(true)
    end
  end

  context 'lists that do not match same level structure' do
    it 'works for one level' do
      packet_comparer = Day13::PacketComparer.new(%w([ [ 1 ] 1 3 1 1 ] ]), %w([ 1 1 5 1 1 ]))
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'returns false for one level if incorrect order' do
      packet_comparer = Day13::PacketComparer.new(%w([ [ 2 ] 1 3 1 1 ] ]), %w([ 1 1 5 1 1 ]))
      expect(packet_comparer.compare_packets).to eq(false)
    end

    it 'returns false for incorrect imbricated lists sizes' do
      packet_comparer = Day13::PacketComparer.new(%w([ [ 1 1 3 ] 1 1 ] ]), %w([ 1 1 5 1 1 ]))
      expect(packet_comparer.compare_packets).to eq(false)
    end

    it 'returns true for correctly imbricated lists' do
      packet_comparer = Day13::PacketComparer.new(%w([ 1 1 [ 3 ] [ 1 1 ] ]), %w([ 1 1 5 1 1 ]))
      expect(packet_comparer.compare_packets).to eq(true)
    end
  end

  context 'right is more imbricated than left' do
    it 'runs' do
      packet_comparer = Day13::PacketComparer.new(%w([ 9 ] ), %w([ [ 8 7 6 ] ]))
      expect(packet_comparer.compare_packets).to eq(false)
    end
  end

  context 'empty lists' do
    it 'runs an empty lists in left' do
      packet_comparer = Day13::PacketComparer.new('[]'.chars, '[3]'.chars)
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'compares empty lists with right running out faster' do
      packet_comparer = Day13::PacketComparer.new('[[[]]]'.chars, '[[]]'.chars)
      expect(packet_comparer.compare_packets).to eq(false)
    end

    it 'compares empty lists with left running out faster' do
      packet_comparer = Day13::PacketComparer.new('[[]]'.chars, '[[[]]]'.chars)
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'multiple empty lists in left' do
      packet_comparer = Day13::PacketComparer.new(%w([ [ ] [ ] [ ] [ ] [ ] ]), %w([ [ ] ]))
      expect(packet_comparer.compare_packets).to eq(false)
    end
  end

  context 'multiple digit numbers' do
    it 'runs' do
      packet_comparer = Day13::PacketComparer.new(%w([ 10 ]), %w([ [ 9 7 6 ] ]))
      expect(packet_comparer.compare_packets).to eq(false)
    end
  end
end
