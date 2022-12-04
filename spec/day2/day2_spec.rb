describe Day2 do

  it 'runs the file for part one' do
    expect(Day2.new.call).to eq(11475)
  end


  it 'runs the file for part two' do
    expect(Day2.new(part: :part_two).call).to eq(16862)
  end
end
