class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true

  after_initialize :ensure_session_token

  has_many(
    :notes,
    :class_name => "Note",
    :foreign_key => :user_id,
    :primary_key => :id
  )

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end


  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
    #why not save?
  end

  def password=(password)
    return unless password.present?
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    #what is the difference between these two?
    #self.password_digest == Bcrypt::Password.create(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
