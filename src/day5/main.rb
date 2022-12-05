module Day5
  class Main
    def initialize(part: :part_one, file_path: "#{__dir__}/input.txt" )
      @stacks = []
      @file_path = file_path
      @part = part
    end

    def call
      read_file do |line|
        if Day5::CrateStack.crate_stack_line?(line)
          @stacks = create_stacks(line, stacks)
        elsif Day5::Instruction.instruction_line?(line)
          instruction = Day5::Instruction.new(line)
          @stacks = part == :part_one ? instruction.move(stacks) : instruction.move_multiple(stacks)
        end
      end

      first = []
      @stacks.each do |stack|
        first << stack.head
      end

      first
    end

    private

    attr_accessor :stacks, :file_path, :part

    def create_stacks(line, stacks)
      stacks = Day5::CrateStack.add_to_stack(line, stacks)
    end

    def read_file
      file = File.open(file_path)
      file.readlines.each do |line|
        yield line
      end
    end
  end
end