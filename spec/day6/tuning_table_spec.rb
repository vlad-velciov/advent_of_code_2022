# frozen_string_literal: true

describe Day6::TuningTable do

  it 'runs the example 1 ' do
    expect(Day6::TuningTable.new(file_path: "#{__dir__}/example_1.txt").find).to eq(7)
  end

  it 'runs example 2' do
    expect(Day6::TuningTable.new(file_path: "#{__dir__}/example_2.txt").find).to eq(11)
  end

  it 'runs the input' do
    expect(Day6::TuningTable.new.find).to eq(1)
  end
end
