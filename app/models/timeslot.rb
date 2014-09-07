class Timeslot < ActiveRecord::Base
  before_save :add_end_time
  validates :start_time, numericality: { greater_than: 0 }

  def add_end_time
    self.end_time = self.start_time + (3600 * self.duration.to_i)
  end
end
