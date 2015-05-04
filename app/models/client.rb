class Client < ActiveRecord::Base
  belongs_to :discount_type

  validates_presence_of :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end
end
