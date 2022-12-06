module Day6
  class TuningTable
    def initialize(file_path: "#{__dir__}/input.txt", marker_size: 4)
      @file_path = file_path
      @marker_hash = {}
      @marker_index = 0
      @marker_size = marker_size
    end

    def find
      read_file do |line|
        line.chars.each_with_index do |char, index|
          push_to_marker(char, index)

          return marker_hash.min_by{|k,v| v}.last + marker_size if marker?
        end
      end

      0
    end

    private

    def marker?
      marker_hash.compact.size == marker_size
    end

    def push_to_marker(char, index)
      unless marker_hash[char].nil?
        found_index = marker_hash[char]
        @marker_hash.each{ |key, current_index| @marker_hash.delete(key) if current_index <= found_index}
        @marker_index = index
      end

      @marker_hash[char] = index
    end

    attr_accessor :file_path, :marker_hash, :marker_index, :marker_size
    def read_file
      file = File.open(file_path)
      file.readlines.each do |line|
        yield line
      end
    end
  end
end