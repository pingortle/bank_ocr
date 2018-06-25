module BankOcr
  class Processor
    def initialize(parser: BankOcr::Parser.new, formatter: BankOcr::Formatter.new)
      @parser = parser
      @formatter = formatter
    end

    def process(text)
      @formatter.format @parser.parse(text)
    end
  end
end
