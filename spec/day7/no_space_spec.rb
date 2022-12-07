# frozen_string_literal: true

describe Day7::NoSpace do

  describe 'part one ' do
    it 'runs the example' do
      expect(Day7::NoSpace.new(file_path: "#{__dir__}/example1.txt").call).to eq(64)
    end

    it 'runs part1' do
      expect(Day7::NoSpace.new.call).to eq(1232307)
    end
  end

  describe 'part two' do
    it 'runs the example' do
      expect(Day7::NoSpace.new(file_path: "#{__dir__}/example1.txt").size_to_be_deleted_for_update).to eq(64)
    end

    it 'runs part1' do
      expect(Day7::NoSpace.new.size_to_be_deleted_for_update).to eq(7268994)
    end
  end
end
