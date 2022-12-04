class Day3Two

  def initialize(part: :part_one, file_path: "#{__dir__}/input.txt")
    @file_path = file_path
    @total_priorities = 0
  end

  def call
    group_counter = 1
    letters = {}

    read_file do |rucksack|
      rucksack.strip!

      if group_counter > 3
        group_counter = 1
        letters = {}
      end

      if group_counter == 1
        rucksack.chars.each do |item|
          letters[item] = true
        end
      elsif group_counter == 2
         rucksack.chars.each do |item|
           letters[item] = :bla if letters[item]
         end
      else
        found = ''
        rucksack.chars.each do |item|
          found = item if letters[item] == :bla
        end

        add_found_item(found)
      end

      group_counter += 1
    end

    @total_priorities
  end

  private

  def split_rucksack(rucksack)
    rucksack.strip!

    compartment_one = rucksack[0..rucksack.length / 2 - 1]
    compartment_two = rucksack[rucksack.length / 2..-1]

    [compartment_one, compartment_two]
  end

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