module Day5
  class Instruction
    class << self
      def instruction_line?(line)
        line.include?('move')
      end
    end

    def initialize(line)
      @number_of_crates = get_number_of_crates(line)
      @from_stack = get_from_stack(line)
      @to_stack = get_to_stack(line)
    end

    def move(stacks)
      @number_of_crates.times do
        stacks[@to_stack].unshift(stacks[@from_stack].shift)
      end

      stacks
    end

    def move_multiple(stacks)
      temp = stacks[@from_stack].shift_multiple(@number_of_crates)
      stacks[@to_stack].unshift_multiple(temp)

      stacks
    end

    def to_s
      "#{@number_of_crates}-#{@from_stack}-#{@to_stack}"
    end

    private

    def get_number_of_crates(line)
      line.split(' ')[1].to_i
    end

    def get_from_stack(line)
      line.split(' ')[3].to_i - 1
    end

    def get_to_stack(line)
      line.split(' ')[5].to_i - 1
    end
  end
end
