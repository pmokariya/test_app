class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable,authentication_keys: {email: true}

  # def email_required?
  #   false
  # end
  
  # def will_save_change_to_email?
  #   false
  # end

  # include ActiveModel::Validations
  
  # has_many :password_histories
  # after_save :store_digest
  # validates :password, :unique_password => true

  # private
  
  # def store_digest
  #   if self.password == self.username
  #     if encrypted_password_changed?
  #       PasswordHistory.create(:user => self, :encrypted_password => encrypted_password)
  #       @user_all_password = self.password_histories.order(created_at: :desc).collect(&:id)
  #       @last_password = self.password_histories.order(created_at: :desc).last(6).collect(&:id)
  #       @extra_password = @user_all_password - @last_password
  #       PasswordHistory.where(id: @extra_password).destroy_all 
  #     end
  #     "Password must be diffrent then username."
  #   end
  # end

  # # validates :username, presence: :true, uniqueness: { case_sensitive: false }
  # # validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # # validate :validate_username
  # # def validate_username
  # #    puts "......1a..validate_username.#{}"
  # #   if User.where(email: username).exists?
  # #      puts "......1asdasda...#{User.where(email: username)}"
  # #     errors.add(:username, :invalid)
  # #   end
  # # end

	attr_writer :login

  def login
    @login || self.email
  end

  # def timeout_in
  #   2.days
  # end

  # def self.find_first_by_auth_conditions(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   else
  #     if conditions[:username].nil?
  #       where(conditions).first
  #     else
  #       where(username: conditions[:username]).first
  #     end
  #   end
  # end
end
