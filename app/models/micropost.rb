class Micropost < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  scope :order_created_at, ->{order(created_at: :desc)}
  scope :feed, ->(current_user_id){where user_id: current_user_id}

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.m140}
  validates :image, content_type: {in: Settings.content_t,
                                   message: t(".microposts.must_be")}, size: {less_than: Settings.n5.megabytes,
                                                                              message: t(".microposts.less_than")}

  def display_image
    image.variant(resize_to_limit: [Settings.n500, Settings.n500])
  end
end
