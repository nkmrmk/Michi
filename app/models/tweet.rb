class Tweet < ApplicationRecord
    belongs_to :user
    has_one_attached :photo
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :tweet_tag_relations, dependent: :destroy
    has_many :tags, through: :tweet_tag_relations, dependent: :destroy
end
