class Address < ActiveRecord::Base
  has_and_belongs_to_many :messages
  validates_uniqueness_of :name

   def self.search(search)
    if search != ""
      where('LOWER(name) LIKE ?', "%#{search.downcase}%")
    else
      []
    end
  end
end
