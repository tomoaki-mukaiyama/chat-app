class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def previous
    Message.where(id: 1..self.id).order("id DESC").first
  end
 
  def next
    Message.where(id: self.id..1).order("id ASC").first
  end
end
