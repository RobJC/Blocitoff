class Item < ActiveRecord::Base
  belongs_to :user
  
  default_scope { order('updated_at DESC') }
  
  validates :name, length: { minimum: 4 }, presence: true
  validates :user, presence: true
  
  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i
  end
end
