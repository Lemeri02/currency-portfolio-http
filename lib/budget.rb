class Budget
  def initialize(rate, rubs, dollars)
    @rate = rate
    @rubs = rubs
    @dollars = dollars
    @imbalance = imbalance.round(2)
  end

  def half_budget
    ((@rubs / @rate) + @dollars) / 2
  end

  def imbalance
    @dollars - half_budget
  end

  def calculate
    return perfectly_fine if @imbalance.between?(-1, 1)
    return sell if @imbalance.positive?

    buy
  end

  def perfectly_fine
    'Бюджет сбалансирован в пределах ± $1'
  end

  def sell
    "Вам нужно продать $#{@imbalance}"
  end

  def buy
    "Вам нужно купить $#{@imbalance.abs}"
  end

  def to_s
    calculate
  end
end
