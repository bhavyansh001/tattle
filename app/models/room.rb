class Room < ApplicationRecord
    validates :name, uniqueness: true
    has_many :messages
    has_many :participants, dependent: :destroy

    def self.create_private_room(user1, user2, room_name)
        single_room = Room.create(name: room_name)
            Participant.create(user_id: user1.id, room_id: single_room.id)
            Participant.create(user_id: user2.id, room_id: single_room.id)
        single_room
    end
end
