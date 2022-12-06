# frozen_string_literal: true

describe Day6::TuningTable do

  it 'runs the example 1 ' do
    expect(Day6::TuningTable.new(file_path: "#{__dir__}/example_1.txt").find).to eq(7)
  end

  it 'runs example 2' do
    expect(Day6::TuningTable.new(file_path: "#{__dir__}/example_2.txt").find).to eq(11)
  end

  it 'runs the input' do
    expect(Day6::TuningTable.new.find).to eq(1623)
  end

  describe 'part two' do
    it 'runs for part two' do
      expect(Day6::TuningTable.new(marker_size: 14).find).to eq(3774)
    end

    it 'runs the example 1' do
      expect(Day6::TuningTable.new(marker_size: 14, file_path: "#{__dir__}/example_1.txt").find).to eq(19)
    end
  end
end
