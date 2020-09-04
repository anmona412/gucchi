class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :age
  belongs_to_active_hash :profession

  validates :user_id, presence: true 
  with_options numericality: { other_than: 1 } do
    validates :age_id
    validates :profession_id
  end
end
