class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :is_clickbait

      CLICKBAIT_NAMES = [
        /Won't Believe/i,
        /Secret/i,
       /Top [0-9]/i,
        /Guess/i
    ]

    def is_clickbait
            if CLICKBAIT_NAMES.none? { |value| value.match title }
        errors.add(:title, "must be clickbait")
        end
    end

end
