# frozen_string_literal: true

describe Day8::TreeTopHouse do

  describe 'part1' do
    it 'runs the example' do
      expect(Day8::TreeTopHouse.new(file_path: "#{__dir__}/example1.txt").visible_trees).to eq(21)
    end

    it 'runs the input' do
      expect(Day8::TreeTopHouse.new.visible_trees).to eq(1809)
    end
  end

  describe 'part2' do

  end
end
