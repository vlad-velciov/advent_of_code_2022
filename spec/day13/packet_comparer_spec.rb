# frozen_string_literal: true

describe Day13::PacketComparer do
  context 'simple one level integers lists' do
    it 'works if packets in right order' do
      packet_comparer = Day13::PacketComparer.new('[1,1,3,1,1]'.chars, '[1,1,5,1,1]'.chars)
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'returns false for packets in wrong order' do
      packet_comparer = Day13::PacketComparer.new('[1,1,6,1,1]'.chars, '[1,1,5,1,1]'.chars)
      expect(packet_comparer.compare_packets).to eq(false)
    end

    it 'returns false if the right packets ends earlier than the left one' do
      packet_comparer = Day13::PacketComparer.new('[1,1,3,1,1]'.chars, '[1,1,5,1]'.chars)
      expect(packet_comparer.compare_packets).to eq(false)
    end

    it 'returns true if the left packet ends earlier than the left one' do
      packet_comparer = Day13::PacketComparer.new('[1,1,3,1]'.chars, '[1,1,5,1,1]'.chars)
      expect(packet_comparer.compare_packets).to eq(true)
    end
  end

  context 'lists with same level structure' do
    it 'works if lists wrap everything' do
      packet_comparer = Day13::PacketComparer.new('[[1,1,3,1,1]]'.chars, '[[1,1,5,1,1]]'.chars)
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'works if lists wrap the same number and place for both packets' do
      packet_comparer = Day13::PacketComparer.new('[[1,1,3],1,1]'.chars, '[[1,1,5],1,1]'.chars)
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'works if there are multiple lists' do
      packet_comparer = Day13::PacketComparer.new('[[1,1,3],1,[1]]'.chars, '[[1,1,5],1,[1]]'.chars)
      expect(packet_comparer.compare_packets).to eq(true)
    end
  end

  context 'lists that do not match same level structure' do
    it 'works for one level' do
      packet_comparer = Day13::PacketComparer.new('[[1],1,3,1,1]]'.chars, '[1,1,5,1,1]'.chars)
      expect(packet_comparer.compare_packets).to eq(true)
    end

    it 'returns false for one level if incorrect order' do
      packet_comparer = Day13::PacketComparer.new('[[2],1,3,1,1]]'.chars, '[1,1,5,1,1]'.chars)
      expect(packet_comparer.compare_packets).to eq(false)
    end

    it 'returns false for incorrect imbricated lists sizes' do
      packet_comparer = Day13::PacketComparer.new('[[1,1,3],1,1]]'.chars, '[1,1,5,1,1]'.chars)
      expect(packet_comparer.compare_packets).to eq(false)
    end

    it 'returns true for correctly imbricated lists' do
      packet_comparer = Day13::PacketComparer.new('[1,1,[3],[1,1]]'.chars, '[1,1,5,1,1]'.chars)
      expect(packet_comparer.compare_packets).to eq(true)
    end
  end
end
