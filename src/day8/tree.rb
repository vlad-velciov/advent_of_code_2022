module Day8
  class Tree
    attr_reader :line, :column, :height

    def initialize(line, column, height)
      @line = line
      @column = column
      @height = height
    end

    def eql?(other)
      self.line == other.line && self.column == other.column
    end

    def hash
      [self.line, self.column].hash
    end

    def to_s
      "#{@line}-#{@column}-#{@height}"
    end
  end
end