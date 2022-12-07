module Day7

  class CdCommand
    attr_reader :target
    def initialize(cli_command)
      @target = cli_command.parts[2]
    end

    def exit?
      target == '..'
    end
  end
end