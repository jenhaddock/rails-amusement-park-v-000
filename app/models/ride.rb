class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    if user.tickets >= attraction.tickets && user.height >= attraction.min_height
      user.update(:tickets => user.tickets - attraction.tickets)
      user.update(:nausea => attraction.nausea_rating)
      user.update(:happiness => attraction.happiness_rating)
    end
  end
end
