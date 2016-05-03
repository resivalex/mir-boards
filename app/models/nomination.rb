class Nomination < ActiveRecord::Base
  enum gender: { any_gender: 0, male: 1, female: 2 }

  validates :name, presence: true, uniqueness: true

  after_initialize :set_default_gender, :if => :new_record?

  def set_default_gender
    self.gender ||= :any_gender
  end
end
