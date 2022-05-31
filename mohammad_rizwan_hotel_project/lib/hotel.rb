require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |room_names, capacities|
            @rooms[room_names] = Room.new(capacities)
        end
    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(roomname)
        @rooms.has_key?(roomname)
    end

    def check_in(person, roomname)
        if !self.room_exists?(roomname)
            puts "sorry, room does not exist"
            return
        end
        success = @rooms[roomname].add_occupant(person)
        if success
            puts "check in successful"
        else
            puts "sorry, room is full"
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| !room.full?}
    end

    def list_rooms
        @rooms.each do |roomname, room| 
            puts "#{roomname} : #{room.available_space}"
        end
    end
end
