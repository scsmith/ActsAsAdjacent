# ActsAsAdjacent
module ActsAsAdjacent
  def acts_as_adjacent
    include InstanceMethods
    
    self.class_eval do
      named_scope :previous, lambda { |i| {:conditions => ["#{self.table_name}.id < ?", i.id], :order => "#{self.table_name}.id DESC"} }
      named_scope :next, lambda { |i| {:conditions => ["#{self.table_name}.id > ?", i.id], :order => "#{self.table_name}.id ASC"} }
    end
  end
  
  module InstanceMethods
=begin
    #def next(limit = 1)
    #  items = self.class.next(self).find(:all, :limit => (limit || 1))
    #  return nil if items.empty?
    #  items.size == 1 ? items.first : items
    #end
    
    # gets the previous x items going backwards from the item.
    # These will be returned in reverse order from the one before the item so may need to be reversed.
    #def previous(limit = 1, reverse = true)
    #  items = self.class.previous(self).find(:all, :limit => (limit || 1))
    #  items = items.reverse if reverse
    #  return nil if items.empty?
    #  items.size == 1 ? items.first : items
    #end
    
    #def offset
      #self.class.count(:conditions => ["#{self.class.table_name}.id < #{self.id}"])
    #end

    # returns the closest x items to the current item. This will not always equal the number specified for example if there are no items
    # after this then there will only be previous items returned.    
    def closest(limit = 5)
      before = ((limit - 1) / 2.0).floor
      after = ((limit - 1) / 2.0).floor
      puts before
      puts after
      
      previous_items = previous(before)
      next_items = self.next(after)
      
      items = []
      items = items.concat([previous_items].flatten) if previous_items
      items = items.concat([self])
      items = items.concat([next_items].flatten) if next_items
      items
    end
=end
  end
end