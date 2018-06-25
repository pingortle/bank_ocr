module BankOcr
  class Parser
    CODE_LENGTH = 9
    TOKEN_WIDTH = 3
    TOKEN_HEIGHT = 3
    TOKEN_MAP = {
      ' _ | ||_|' => 0,
      '     |  |' => 1,
      ' _  _||_ ' => 2,
      ' _  _| _|' => 3,
      '   |_|  |' => 4,
      ' _ |_  _|' => 5,
      ' _ |_ |_|' => 6,
      ' _   |  |' => 7,
      ' _ |_||_|' => 8,
      ' _ |_| _|' => 9,
    }

    def parse(text)
      text.each_line.each_slice(TOKEN_HEIGHT + 1).map do |code_lines|
        CODE_LENGTH.times.map do |code_index|
          token_location = code_index * TOKEN_WIDTH

          token_lines = code_lines.take(TOKEN_HEIGHT).flat_map do |line|
            line[token_location...token_location + TOKEN_WIDTH].ljust(3)
          end

          TOKEN_MAP[token_lines.join]
        end
      end
    end
  end
end
