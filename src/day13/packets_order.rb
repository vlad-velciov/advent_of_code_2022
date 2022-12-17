module Day13
  class PacketsOrder
    def initialize(file_path: "#{__dir__}/input.txt")
      @file_path = file_path
      @indices_of_solutions = []
    end

    def call
      pair_index = 1
      read_file do |line, index|
        left = read_packet(line) if !line.empty && index % 2 == 0
        right = read_packet(line) if !line.empty && index % 2 != 0
        pair_index += 1 if line.empty

        if left && right
          @indices_of_solutions << pair_index if in_right_order?(left, right)
        end
      end
    end

    private

    def read_packet(line)
      line
    end

    def in_right_order?(left, right)
      packet_comparer = PacketComparer.new(left.chars, right.chars)
      packet_comparer.compare
    end

    attr_reader :file_path

    def read_file
      file = File.open(file_path)
      file.readlines.each_with_index do |line, index|
        yield line.chomp, index
      end
    end

  end
end