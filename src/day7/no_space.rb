module Day7
  class NoSpace
    def initialize(file_path: "#{__dir__}/input.txt")
      @file_path = file_path
      @parsing_stack = []
      @solution_array = []
    end

    def call
      read_file do |line|
        cli_line = CliLine.new(line)
        compute_line cli_line
      end

      solutions_sum
    end

    private
    def compute_line(cli_line)
      if cli_line.cd_enter_directory?
        cd_command = CdCommand.new(cli_line)
        add_to_stack cd_command.target
      elsif cli_line.cd_exit_directory?
        directory = pop_stack
        add_size_to_stack_head directory.size
        add_to_solution_array directory if directory.small_enough_for_deletion?
      elsif cli_line.ls?
        # do nothing
      elsif cli_line.file_line?
        file_entry = FileEntry.new(cli_line)
        add_size_to_stack_head file_entry.size
      elsif cli_line.dir_line?
        # do nothing
      end
    end

    def pop_stack
      parsing_stack.pop
    end

    def add_to_stack(folder_name)
      directory = Directory.new(name: folder_name)
      parsing_stack << directory
    end

    def add_size_to_stack_head(size)
      parsing_stack.last.add_size(size)
    end

    def valid_for_deletion?(directory)
      directory.small_enough_for_deletion?
    end

    def add_to_solution_array(directory)
      solution_array << directory
    end

    def solutions_sum
      sum = 0
      solution_array.each do |directory|
        sum += directory.size
      end

      sum
    end

    attr_accessor :parsing_stack, :solution_array, :file_path
    def read_file
      file = File.open(file_path)
      file.readlines.each do |line|
        yield line
      end

    end
  end
end