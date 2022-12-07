module Day7
  class Directory

    attr_reader :name, :size
    def initialize(name: , size: 0)
      @name = name
      @size = size.to_i
    end

    def add_size(new_size)
      @size += new_size
    end

    def small_enough_for_deletion?
      size <= 100_000
    end
  end
end