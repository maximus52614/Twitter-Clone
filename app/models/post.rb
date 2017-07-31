class Find < ActiveRecord::Base
  def self.search(search)
    where("username LIKE ?", "%#{search}%")
    where("content LIKE ?", "%#{search}%")
  end

  Class Post < ActiveRecord::Base
   belongs_to :user
   scope :subscribed, ->(followers) { where user_id: followers }
  end
end
