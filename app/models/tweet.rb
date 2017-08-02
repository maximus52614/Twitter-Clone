class Tweet < ApplicationRecord
  belongs_to :user
  validates :content,
    length: { maximum: 150 },
    presence: true

  before_save :delete_whitespaces

private

  def delete_whitespaces
    self.content = self.content.strip
  end
end
