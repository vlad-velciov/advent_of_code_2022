module Day7
  class FileEntry
    attr_reader :size, :name
    def initialize(cli_line)
      @size = cli_line.parts[0].to_i
      @name = cli_line.parts[1]
    end
  end
end