class Blog < ActiveRecord::Base
  has_many :entries

  validates :title, presence: true

end
