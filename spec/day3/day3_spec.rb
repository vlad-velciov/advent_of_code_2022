describe Day3 do

  it 'runs the first part' do
    expect(Day3.new.call).to eq(7848)
  end

  it 'runs example part one' do
    expect(Day3.new(part: :part_one, file_path:  "#{__dir__}/custom_input.txt").call).to eq(157)
  end

end
