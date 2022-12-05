describe Day5::Instruction do

  describe '#initialize' do
    it 'creates an instruction from a line' do
      expect(Day5::Instruction.new('move 10 from 2 to 3').to_s).to eq('10-2-3')
    end
  end

  describe '#move' do
    it 'moves from one stack to another' do

    end
  end
end
