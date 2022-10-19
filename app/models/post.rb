class Post < ApplicationRecord

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :click_baity

  # bait_words = ["Won't Believe", "Secret", "Guess", "Top [number]"]

  def click_baity
    unless title.include?("Won't Believe" || "Secret" || "Guess" || "Top [number]")
      errors.add(:title, "not click-baity enough")
    end
  end

end
