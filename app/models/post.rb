class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "Must choose Fiction or Non-Fiction, %{value} is not a valid category" }
  validate :title_sticky

  def title_sticky
    unless !title.nil? && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top [number]") || title.include?("Guess"))
      errors.add(:title, "Title needs to be more clickybaity and sticky")
    end
  end

end
