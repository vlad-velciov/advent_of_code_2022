require 'json'

module Day13
  class PacketsOrder
    def initialize(file_path: "#{__dir__}/input.txt")
      @file_path = file_path
    end

    def correct_pair_indexes
      indices_of_solutions = []
      pair_index = 1
      left = nil
      right = nil
      read_file do |line, index|
        left = read_packet(line) if !(line == '') && (index % 3) % 2 == 0
        right = read_packet(line) if !(line == '') && (index % 3) % 2 != 0
        if line == ''
          pair_index += 1
          left = nil
          right = nil
          next
        end

        if left && right
          indices_of_solutions << pair_index if in_right_order?(left, right)
        end
      end

      indices_of_solutions
    end

    private

    # [10,9]
    def read_packet(line)
      return JSON.parse(line)
      as_array = line.chars
      new_array = []
      as_array.each do |char|
        if integer?("#{new_array.last}#{char}")
          new_array << "#{new_array.pop}#{char}"
        else
          new_array << char
        end
      end

      new_array.reject! { |char| char == ','}

      new_array
    end

      def integer?(string)
        Integer(string)
        true
      rescue
        false
      end

    def in_right_order?(left, right)
      packet_comparer = PacketComparer.new(left, right)
      packet_comparer.compare_packets
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