class Day4

  def initialize(part: :part_one ,file_path: "#{__dir__}/input.txt")
    @file_path = file_path
    @total_overlaps = 0
    @part = part
  end

  def call
    read_assignments do |assignments|
      if part == :part_one
        @total_overlaps += 1 if is_contained_within(assignments[0], assignments[1]) || is_contained_within(assignments[1], assignments[0])
      else
        @total_overlaps +=1 if is_overlap(assignments[0], assignments[1]) || is_overlap(assignments[1], assignments[0])
      end
    end

    total_overlaps
  end

  private

  attr_reader :file_path, :part, :total_overlaps

  def is_contained_within(contained, container)
    lower_margin_contained, upper_margin_contained = contained.split('-').map(&:to_i)
    lower_margin_container, upper_margin_container = container.split('-').map(&:to_i)

    lower_margin_container <= lower_margin_contained && upper_margin_container >= upper_margin_contained
  end

  def is_overlap(contained, container)
    lower_margin_contained, upper_margin_contained = contained.split('-').map(&:to_i)
    lower_margin_container, upper_margin_container = container.split('-').map(&:to_i)

    lower_margin_container <= lower_margin_contained && upper_margin_container >= lower_margin_contained ||
      lower_margin_container > lower_margin_contained && upper_margin_container <= upper_margin_contained
  end

  def read_assignments
    read_file do |line|
      assignments = line.strip!.split(',')
      yield assignments
    end
  end

  def read_file
    file = File.open(file_path)
    file.readlines.each do |line|
      yield line
    end
  end
end