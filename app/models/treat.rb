class Treat < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Trick' },
    { id: 2, name: 'Treat' }
  ]

  include ActiveHash::Associations
  has_many :room_details
end
