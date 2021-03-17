module FormsHelper
  def valid_field()
    "<div class='valid-field'> Looks good!</div>"
  end

  def invalid_field(error_message)
    "<div class='invalid-field'>#{error_message}</div>"
  end
end