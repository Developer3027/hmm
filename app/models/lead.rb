class Lead < ApplicationRecord
  before_save :format_phone_number

  private

  # Reformat phone number to (123) 456-7890 from whatever the user entered
  def format_phone_number
    self.phone = self.phone.gsub(/\D/, '').insert(0, '(').insert(4, ') ').insert(9, '-')
  end
end
