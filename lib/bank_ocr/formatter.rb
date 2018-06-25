module BankOcr
  class Formatter
    def format(codes)
      codes.map { |tokens| tokens.map(&:to_s).join }.join("\n")
    end
  end
end
