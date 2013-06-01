class Profile < ActiveRecord::Base
  attr_accessible :age, :corporation, :email, :first_name, :job_title, :last_name, :lattitude, :location, :longitude, :photo, :tutor

  belongs_to :user
  before_create :generate_activation_key
  validates_uniqueness_of :activation_key


  def best_name
    "#{first_name} #{last_name}" || first_name || last_name || email
  end
private
  def generate_activation_key
    begin
      self.activation_key = SecureRandom.urlsafe_base64(16)
    end while self.class.exists?(activation_key: activation_key)
  end
end
