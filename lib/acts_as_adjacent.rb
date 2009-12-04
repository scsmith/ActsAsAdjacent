# ActsAsAdjacent
module ActsAsAdjacent
  def acts_as_adjacent
    include InstanceMethods
    
    self.class_eval do
      named_scope :previous, lambda { |i| {:conditions => ["id < ?", i.id], :limit => 1, :order => :id} }
      named_scope :next, lambda { |i| {:conditions => ["id > ?", i.id], :limit => 1, :order => :id} }
    end
  end
  
  module InstanceMethods
    def next
      self.class.next(self).first
    end

    def previous
      self.class.previous(self).first
    end
  end
end