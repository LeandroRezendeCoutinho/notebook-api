class ContactSerializer < ActiveModel::Serializer
  belongs_to :kind
  has_many :phones
  has_one :address

  attributes :id, :name, :email, :birthdate

  def attributes(*args)
    hash = super(*args)
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end
end
