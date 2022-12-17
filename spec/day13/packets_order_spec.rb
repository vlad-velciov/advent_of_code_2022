# frozen_string_literal: true

describe Day13::PacketsOrder do

  describe 'part1' do
    it 'runs the example' do
      expect(Day13::PacketsOrder.new(file_path: "#{__dir__}/example1.txt").call).to eq(13)
    end

    it 'works for simple integers' do

    end
  end
end
