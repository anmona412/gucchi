class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  # assosiation
  has_one :profile
  has_many :sns_credentials
  has_many :posts
  
  # validation
  with_options presence: true do
    num_and_char = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

    validates :nickname
    validates :password, format: { with: num_and_char, message: '英数半角混合で設定してください' }
  end


  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    {user: user, sns: sns}
  end
end
