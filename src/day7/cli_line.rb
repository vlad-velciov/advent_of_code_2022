module Day7
  class CliLine

    attr_reader :line_string

    def initialize(line_string)
      @line_string = line_string
    end

    def parts
      @line_string.split(' ')
    end

    def cd_enter_directory?
      parts[0] == '$' && parts[1] == 'cd' && parts[2] != '..'  && parts[2] != '.'
    end

    def cd_exit_directory?
      parts[0] == '$' && parts[1] == 'cd' && parts[2] == '..'
    end

    def ls?
      parts[0] == '$' && parts[1] == 'ls'
    end

    def file_line?
      /\A[-+]?\d+\z/ === parts[0]
    end

    def dir_line?
      parts[0] == 'dir'
    end
  end
end