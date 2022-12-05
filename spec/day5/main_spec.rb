describe Day5::Main do

  it 'runs the file' do
    expect(Day5::Main.new.call).to eq(%w[S P F M V D T Z T])
  end
end
