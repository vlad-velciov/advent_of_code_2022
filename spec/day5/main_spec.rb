describe Day5::Main do

  it 'runs the file' do
    expect(Day5::Main.new.call).to eq(%w[S P F M V D T Z T])
  end

  it 'runs the file with moving multiple crates at once' do
    expect(Day5::Main.new(part: :part_two).call).to eq(%w[Z F S J B P R F P])
  end
end
