class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validate :clickbait

  private
  def clickbait
    if !self.title.nil?
      if !self.title.include?("Won't Believe") && !self.title.include?("Secret") && !self.title.include?("Top[number]") && !self.title.include?("Guess")
        errors.add(:title, false)
      end
    end
  end
end
