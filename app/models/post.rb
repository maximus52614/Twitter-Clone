class Find < ActiveRecord::Base
  def self.search(search)
    where("username LIKE ?", "%#{search}%")
    where("content LIKE ?", "%#{search}%")
  end
end
