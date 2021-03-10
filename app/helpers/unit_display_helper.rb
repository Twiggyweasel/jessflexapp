module UnitDisplayHelper
  def display_currency(amount)
    return number_to_currency(amount * 0.01)
  end
end
