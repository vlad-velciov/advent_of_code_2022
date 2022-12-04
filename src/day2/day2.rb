class Day2

  def initialize(part: :part_one, file_path: "#{__dir__}/input.txt")
    @file_path = file_path
    @total_score = 0
    @part = part
  end


  def call
    read_file do |round|
      score_index = round.gsub(/\s+/, "")
      score_matrix = get_score_matrix(part)
      @total_score += score_matrix[score_index]
    end

    total_score
  end

  private

  attr_accessor :file_path, :total_score, :part

  def score_matrix_part_one
    ##
    # A: rock
    # B: paper
    # C: scissors
    # X: rock 1
    # Y: paper 2
    # Z: scissors 3
    # win: 6
    # draw: 3
    # loose: 0
    {
      'AX' => 1+3,
      'AY' => 2+6,
      'AZ' => 3+0,
      'BX' => 1+0,
      'BY' => 2+3,
      'BZ' => 3+6,
      'CX' => 1+6,
      'CY' => 2+0,
      'CZ' => 3+3
    }
  end

  def score_matrix_part_two
    ##
    # A: rock
    # B: paper
    # C: scissors
    # X: need to loose
    # Y: need to draw
    # Z: need to win
    # choosing rock:  1
    # choosing paper:  2
    # choosing scissors:  3
    # win: 6
    # draw: 3
    # loose: 0
    {
      'AX' => 3+0,
      'AY' => 1+3,
      'AZ' => 2+6,
      'BX' => 1+0,
      'BY' => 2+3,
      'BZ' => 3+6,
      'CX' => 2+0,
      'CY' => 3+3,
      'CZ' => 1+6
    }
  end

  def get_score_matrix(part)
    case part
    when :part_one
      score_matrix_part_one
    when :part_two
      score_matrix_part_two
    else
      score_matrix_part_one
    end
  end

  def read_file
    file = File.open(file_path)
    file.readlines.each do |line|
      yield line
    end
  end
end