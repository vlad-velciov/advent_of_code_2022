module Day5
  class CrateStack
    class << self
      def crate_stack_line?(input_line)
        input_line.include?('[')
      end

      def add_to_stack(input_line, stacks = [])
        split = " #{input_line} "
                  .gsub("\n", '')
                  .gsub('    ', '-')
                  .gsub('-', ' -')
                  .split(' ')

        split.each_with_index do |crate, index|
          stacks[index] = CrateStack.new(index:) unless stacks[index]
          stacks[index].add crate unless crate == '-'
        end

        stacks
      end
    end

    def initialize(index:)
      @index = index
      @stack = []
    end

    def add(crate)
      @stack << crate.tr('[]', '')
    end

    def crates
      @stack
    end

    def unshift(crate)
      @stack.unshift crate
    end

    def shift
      @stack.shift
    end

    def unshift_multiple(crates)
      @stack = crates + @stack
    end

    def shift_multiple(number_of_crates)
      temp = @stack[0..number_of_crates-1]
      @stack = @stack[number_of_crates..-1] || []

      temp
    end

    def head
      @stack[0]
    end
  end
end
