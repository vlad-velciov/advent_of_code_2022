describe Day4 do

  it 'runs the file' do
    expect(Day4.new.call).to eq(424)
  end

  it 'runs the file part two' do
    expect(Day4.new(part: :part_two).call).to eq(804)
  end
end
