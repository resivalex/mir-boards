class Entry < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates :event, :user, presence: true
  
  validates_uniqueness_of :user_id, :scope => [:event_id]
end
