class ContactSerializer < ActiveModel::Serializer
  belongs_to :kind
  has_many :phones
  has_one :address

  link(:self) { contact_url(object.id) }
  link(:kind) { kind_url(object.kind.id) }

  attributes :id, :name, :email, :birthdate

  def attributes(*args)
    hash = super(*args)
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end
end
