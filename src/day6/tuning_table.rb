module Day6
  class TuningTable
    MARKER_SIZE = 4

    def initialize(file_path: "#{__dir__}/input.txt")
      @file_path = file_path
      @marker_hash = {}
      @marker_index = 0
    end

    def find
      read_file do |line|
        line.chars.each_with_index do |char, index|
          push_to_marker(char, index)

          return marker_index+4 if marker?
        end
      end
    end

    private

    def marker?
      marker_hash.size == MARKER_SIZE
    end

    def push_to_marker(char, index)
      if marker_hash[char]
        @marker_hash = {}
        @marker_index = index
      end

      @marker_hash[char] = true
    end

    attr_accessor :file_path, :marker_hash, :marker_index
    def read_file
      file = File.open(file_path)
      file.readlines.each do |line|
        yield line
      end
    end
  end
end