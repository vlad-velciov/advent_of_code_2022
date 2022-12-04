describe Day3Two do


  it 'runs the file' do
    expect(Day3Two.new.call).to eq(2616)
  end

  it 'runs the example' do
    expect(Day3Two.new(file_path: "#{__dir__}/example_part_two.txt").call).to eq(70)
  end
end
