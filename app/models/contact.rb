class Contact < ApplicationRecord
  # Validations
  validates_presence_of :kind
  validates_presence_of :address

  # Kaminari
  paginates_per 5

  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address

  def as_json(options = {})
    hash = super(options)
    hash[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    hash
  end
end
