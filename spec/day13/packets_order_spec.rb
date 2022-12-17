# frozen_string_literal: true

describe Day13::PacketsOrder do

  describe 'part1' do
    it 'runs the example' do
      packets_order = Day13::PacketsOrder.new(file_path: "#{__dir__}/example1.txt")
      indexes = packets_order.correct_pair_indexes

      expect(indexes.sum).to eq(13)
    end

    it 'runs the first part' do
      packets_order = Day13::PacketsOrder.new
      indexes = packets_order.correct_pair_indexes

      expect(indexes.sum).to eq(2547)
    end
  end
end
