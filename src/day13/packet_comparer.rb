module Day13
  class PacketComparer
    def initialize(left, right)
      @left = left
      @right = right
    end

    def compare_packets
      compare(@left, @right)[0]
    end

    private

    def compare(left, right)
      right_index = 0
      for left_index in (0..left.size)
        if left[left_index] == '['
          if right[right_index] == '['
            list_comparison, jump_left, jump_right = compare(left[left_index+1..-1], right[right_index+1..-1])
          else
            list_comparison, jump_left, jump_right = compare(left[left_index+1..-1], right[right_index..right_index])
          end

          left_index += jump_left+1
          right_index += jump_right+1

          return false, left_index, right_index unless list_comparison
        end

        return true, left_index, right_index if left[left_index] == ']'
        return false, left_index, right_index if right[right_index] == ']'

        if left[left_index] == ',' && right[right_index] == ','
          right_index +=1
          next
        end

        return false, left_index, right_index if right[right_index].nil?
        return false, left_index, right_index if left[left_index] > right[right_index]

        right_index += 1
      end

      [true, left_index, right_index]
    end

    attr_reader :left, :right
  end
end