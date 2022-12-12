require 'ostruct'

module Day8
  class TreeTopHouse
    def initialize(file_path: "#{__dir__}/input.txt")
      @file_path = file_path
      @maxim_on_line = {}
      @maxim_on_column = {}
      @candidates_column = {}
      @candidates_line = {}
      @visible_trees = []
    end

    def visible_trees
      max_line = 0
      max_column = 0

      read_file do |line, current_line|
        max_line = current_line
        line.split('').each_with_index do |tree_height, current_column|
          max_column = current_column
          compute_tree(tree_height.to_i, current_line, current_column)
        end
      end

      candidates_line_total = 0
      candidates_column_total = 0

      (0..max_line).each { |line| candidates_line_total += @candidates_line[line].count }
      (0..max_column).each { |column| candidates_column_total += @candidates_column[column].count }


      cl = @candidates_column.map{ |k,v| v }.flatten
      ln = @candidates_line.map{ |k,v| v }.flatten

      t = cl+ln
      t.uniq!
      (@visible_trees + t).uniq.count
    end

    private

    def compute_tree(tree_height, current_line, current_column)
      @maxim_on_line[current_line] ||= -1
      @maxim_on_column[current_column] ||= -1

      @candidates_line[current_line] ||= []
      @candidates_column[current_column] ||= []

      visible_backwards = false
      if tree_height > @maxim_on_line[current_line]
        @maxim_on_line[current_line] = tree_height
        visible_backwards = true
      end

      if tree_height > @maxim_on_column[current_column]
        @maxim_on_column[current_column] = tree_height
        visible_backwards = true
      end

      if visible_backwards
        @visible_trees << Tree.new(current_line, current_column, tree_height)
      end

      while !@candidates_line[current_line].empty? && (@candidates_line[current_line][-1]&.height || 99) <= tree_height
        @candidates_line[current_line].pop
      end
      @candidates_line[current_line] << Tree.new(current_line, current_column, tree_height)

      # if popped_line
      #   @candidates_line[current_line] << Tree.new(current_line, current_column, tree_height)
      # elsif @candidates_line[current_line][-1]&.height != tree_height
      #   @candidates_line[current_line] << Tree.new(current_line, current_column, tree_height)
      # end

      # if (@candidates_line[current_line][-1]&.height || 99) < tree_height
      #   @candidates_line[current_line] << Tree.new(current_line, current_column, tree_height)
      # end

      while !@candidates_column.empty? && (@candidates_column[current_column][-1]&.height || 99) <= tree_height
        @candidates_column[current_column].pop
      end
      @candidates_column[current_column] << Tree.new(current_line, current_column, tree_height)

      #
      # if popped_column
      #   @candidates_column[current_column] << Tree.new(current_line, current_column, tree_height)
      # elsif @candidates_column[current_column][-1]&.height != tree_height
      #   @candidates_column[current_column] << Tree.new(current_line, current_column, tree_height)
      # end

      # if (@candidates_column[current_column][-1]&.height || 99) > tree_height
      #   @candidates_column[current_column] << Tree.new(current_line, current_column, tree_height)
      # end

    end

    attr_reader :file_path

    def read_file
      file = File.open(file_path)
      file.readlines.each_with_index do |line, index|
        yield line.chomp, index
      end
    end

  end
end
