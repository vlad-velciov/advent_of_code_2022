class Day1
  def initialize
    @max = 0
    @temp_max = 0

    @top_three = []
  end

  def call
    read_file do |line|
      if empty_newline?(line)
        compare_max
        reset_temp
      end

      add_to_temp(line.to_i)
    end

    @top_three
  end

  private
  attr_accessor :max, :temp_max

  def compare_max
    return unless another_max_found?

    @top_three.pop if @top_three.length >= 3
    @top_three << @temp_max
    @top_three.sort!.reverse!
  end

  def another_max_found?
    return true if @top_three.empty?

    @top_three.each do |elem|
      return true if elem < @temp_max
    end

    false
  end

  def reset_temp
    @temp_max = 0
  end

  def add_to_temp(number)
    @temp_max += number
  end

  def empty_newline?(line)
    line == "\n"
  end

  def read_file
    file = File.open("#{__dir__}/input.txt")
    file.readlines.each do |line|
      yield line
    end
  end
end