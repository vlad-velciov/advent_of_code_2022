module Day7
  class Directory

    attr_reader :name, :size, :limit
    def initialize(name: , limit: , size: 0)
      @name = name
      @size = size.to_i
      @limit = limit
    end

    def add_size(new_size)
      @size += new_size
    end

    def small_enough_for_deletion?
      return true if limit < 0
      size <= limit
    end
  end
end