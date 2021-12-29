class Treat < ActiveHash::Base
  self.data = [
    { id: 1, name: 'trick' },
    { id: 2, name: 'treat' }
  ]

  include ActiveHash::Associations
  has_many :room_details

end