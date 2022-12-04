class Day3

  def initialize(part: :part_one, file_path: "#{__dir__}/input.txt")
    @file_path = file_path
    @total_priorities = 0
  end

  def call
    read_file do |rucksack|
      rucksack.strip!

      compartment_one = rucksack[0..rucksack.length/2-1]
      compartment_two = rucksack[rucksack.length/2..-1]

      common_item = get_common_item_type(compartment_one, compartment_two)
      add_found_item(common_item)
    end

    @total_priorities
  end

  private

  attr_accessor :file_path

  def add_found_item(common_item)
    f = common_item.ord - 65

    if f < 32
      f += 27
    else
      f -= 31
    end

    @total_priorities += f
  end

  def get_common_item_type(compartment_one, compartment_two)
    common_item = ''
    letters = {}
    compartment_one.chars.each do |char|
      letters[char] = true
    end

    compartment_two.chars.each do |char|
      common_item = char if letters[char]
    end

    common_item
  end

  def read_file
    file = File.open(file_path)
    file.readlines.each do |line|
      yield line
    end
  end
end