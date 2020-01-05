class CurrencyUnit
  attr_reader :id, :char_code, :value

  def initialize(units)
    @units = units
    @id = @units[:id]
    @char_code = @units[:char_code]
    @value = @units[:value]
  end
end
