class User < ApplicationRecord
    before_save :downcase_email
    has_secure_password
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format:   { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, length: { in: 6..20 }, presence: true
    validates :nick, presence: true, length: { maximum: 50 }, uniqueness: true
    
    private
    
    # Преобразует адрес электронной почты в нижний регистр.
    def downcase_email
        self.email = email.downcase
    end
end

