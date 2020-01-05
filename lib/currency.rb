class Curency
  attr_reader :currency_units

  def initialize(currency_units)
    @currency_units = currency_units
  end

  def self.from_xml(node)
    units = []

    node.elements.each('ValCurs/Valute') do |element|
      valute = { id: element.attributes['ID'],
                 char_code: element.elements['CharCode'].text,
                 value: element.elements['Value']
                               .text.sub(',', '.').to_f.round(4) }
      units << valute
    end

    new(units.map { |unit| CurrencyUnit.new(unit) })
  end

  def unit
    @currency_units.find { |unit| unit.id == 'R01235' }
  end
end
