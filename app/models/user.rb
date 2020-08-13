class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # assosiation
  belongs_to_active_hash :age
  belongs_to_active_hash :profession

  # validation
  with_options numericality: { other_than: 1 } do
    validates :age_id, :profession_id
  end
end
