module Day13
  class PacketComparer
    def initialize(left, right)
      @left = left
      @right = right
    end

    def compare_packets
      compare(@left, @right) < 1
    end

    private

    def compare(left, right)
      zipped = left.zip(right)
      zipped.each do |left_element, right_element|
        if !(left_element.is_a? Array) && !(right_element.is_a? Array)
          next if !left_element || !right_element
          return false if left_element > right_element
        elsif (left_element.is_a? Array) && !(right_element.is_a? Array)
          result = compare(left_element, [right_element])
          return false unless result
        elsif !(left_element.is_a? Array) && (right_element.is_a? Array)
          result = compare([left_element], right_element)
          return false unless result
        elsif (left_element.is_a? Array) && (right_element.is_a? Array)
          result = compare(left_element, right_element)
          return false unless result
        end
      end

      left.size <= right.size
    end


    ##
    # def compare(left, right):
    #     if left is None:
    #         return -1
    #     if right is None:
    #         return 1
    #
    #     if isinstance(left, int) and isinstance(right, int):
    #         if left < right:
    #             return -1
    #         elif left > right:
    #             return 1
    #         else:
    #             return 0
    #     elif isinstance(left, list) and isinstance(right, list):
    #         for l2, r2 in zip_longest(left, right):
    #             if (result := compare(l2, r2)) != 0:
    #                 return result
    #         return 0
    #     else:
    #         l2 = [left] if isinstance(left, int) else left
    #         r2 = [right] if isinstance(right, int) else right
    #         return compare(l2, r2)

    def compare(left, right)
      return -1 unless left
      return 1 unless right

      if left.is_a? Integer and right.is_a? Integer
        if left < right
          return -1
        elsif left > right
          return 1
        else
          return 0
        end
      elsif (left.is_a? Array) && (right.is_a? Array)
        zipped = left.size >= right.size ? left.zip(right) : right.zip(left).map(&:reverse)

        zipped.each do |left_element, right_element|
          result = compare(left_element, right_element)
          return result if result != 0
        end
        return 0
      else
        l2 = (left.is_a? Integer) ? [left] : left
        r2 = (right.is_a? Integer) ? [right] : right
        compare(l2, r2)
      end
    end

    # def compare(left, right)
    #   right_index = 0
    #   for left_index in (0..left.size)
    #     right_index = left_index
    #     if left[left_index] == '['
    #       if right[right_index] == '['
    #         list_comparison, jump_left, jump_right = compare(left[left_index+1..-1], right[right_index+1..-1])
    #         left_index  += jump_left + 2
    #         right_index += jump_right + 2
    #       elsif right[right_index] == ']'
    #         return false, left_index, right_index
    #       else
    #         list_comparison, jump_left, jump_right = compare(left[left_index+1..-1], right[right_index..right_index] << ']')
    #         left_index  += jump_left + 2
    #         right_index += jump_right + 1
    #       end
    #
    #       return false, left_index, right_index unless list_comparison
    #     elsif right[right_index] == '['
    #       list_comparison, jump_left, jump_right = compare(left[left_index..left_index] << ']', right[right_index+1..-1])
    #
    #       left_index += jump_left+1
    #       right_index += jump_right+2
    #
    #       return false, left_index, right_index unless list_comparison
    #     end
    #
    #     return true, left_index, right_index if left[left_index].nil?
    #     return false, left_index, right_index if right[right_index].nil?
    #
    #     return true, left_index, right_index if left[left_index] == ']'
    #     return false, left_index, right_index if right[right_index] == ']'
    #
    #     return false, left_index, right_index if left[left_index].to_i > right[right_index].to_i
    #
    #     right_index += 1
    #   end
    #
    #   [true, left_index, right_index]
    # end

    attr_reader :left, :right
  end
end