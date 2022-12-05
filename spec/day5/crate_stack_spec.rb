describe Day5::CrateStack do


  describe 'add_to_stack' do

    it 'adds to an empty stack array' do
      stacks = Day5::CrateStack.add_to_stack("[C] [R] [P] [S] [V] [M] [V] [D] [Z]\n")

      expect(stacks.map(&:crates)).to eq([['C'], ['R'], ['P'], ['S'], ['V'], ['M'], ['V'], ['D'], ['Z']])
    end


    it 'adds a line with emtpy crates' do
      stacks = Day5::CrateStack.add_to_stack("[C]             [V]     [V] [D] [Z]\n")
      expect(stacks.map(&:crates)).to eq([['C'], [], [], [], ['V'], [], ['V'], ['D'], ['Z']])
    end

    it 'adds the example' do
      lines = [
        "    [H]         [D]     [P]        \n",
        "[W] [B]         [C] [Z] [D]        \n",
        "[T] [J]     [T] [J] [D] [J]        \n",
        "[H] [Z]     [H] [H] [W] [S]     [M]\n",
        "[P] [F] [R] [P] [Z] [F] [W]     [F]\n",
        "[J] [V] [T] [N] [F] [G] [Z] [S] [S]\n",
        "[C] [R] [P] [S] [V] [M] [V] [D] [Z]\n",
        "[F] [G] [H] [Z] [N] [P] [M] [N] [D]\n",
      ]
      stacks = []
      lines.each do |line|
        stacks = Day5::CrateStack.add_to_stack(line, stacks)
      end

      expect(stacks.map(&:crates)).to eq([["W", "T", "H", "P", "J", "C", "F"], ["H", "B", "J", "Z", "F", "V", "R", "G"], ["R", "T", "P", "H"], ["T", "H", "P", "N", "S", "Z"], ["D", "C", "J", "H", "Z", "F", "V", "N"], ["Z", "D", "W", "F", "G", "M", "P"], ["P", "D", "J", "S", "W", "Z", "V", "M"], ["S", "D", "N"], ["M", "F", "S", "Z", "D"]]
                                      )
    end
  end

end
