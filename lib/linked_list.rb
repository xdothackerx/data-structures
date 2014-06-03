class Waypoint
  attr_accessor :leads_to, :item

  def initialize(item, leads_to = nil)
    @item = item
    @leads_to = leads_to
  end
end

class TreasureHunt
  attr_accessor :num_waypoints, :next_waypoint

  def initialize(loot)
    @next_waypoint = Waypoint.new(loot)
    @num_waypoints = 1
  end

  def add_waypoint(hint)
    current = Waypoint.new(hint)
    current.leads_to = @next_waypoint
    @num_waypoints += 1
    @next_waypoint = current
  end

  def search(value)
    current_loc = @next_waypoint
    result = nil
    while current_loc != nil
      if current_loc.item == value
        result = current_loc
      end
      current_loc = current_loc.leads_to
    end
    return result
  end

  def remove(waypoint)
    current_loc = @next_waypoint
    result = nil
    prev_loc = nil
    while current_loc != nil
      if current_loc.item == waypoint.item
        result = current_loc
        prev_loc.leads_to = current_loc.leads_to
      end
      prev_loc = current_loc
      current_loc = current_loc.leads_to
    end
    return result
  end

  def to_s
    current_loc = @next_waypoint
    result = ""
    while current_loc !=nil
      item = current_loc.item
      if item.is_a?(Symbol)
        result += ":" + item.to_s + ", "
      elsif item.is_a?(String)
        result += "'" + item.to_s + "', "
      else
        result += item.to_s + ", "
      end
      current_loc = current_loc.leads_to
    end
    return result.chomp(", ")

    # while current_loc !=nil
    #   item = current_loc.item
    #   if item.respond_to?(:to_s)
    #     result += item.to_s + ", "
    #   end
    #   current_loc = current_loc.leads_to
    # end
    # return result.chomp(", ")
  end
end
