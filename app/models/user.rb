class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  authenticates_with_sorcery!

  has_one :profile
  
  has_many :subject_users
  has_many :subjects, :through => :subject_users

  # scope :tutors, joins(:profiles, where(:tutor => true)
  # scope :students, where(:tutor => false)


  validates_uniqueness_of :email

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  # def tutors
  #   subjects.collect do |subject|
  #   end
  # end
 
  def tutor?
    profile.tutor
  end

  def student?
    profile.tutor == false
  end

  def tutors
    subjects.map {|sub| sub.users.select {|usr| usr.profile.tutor } }.flatten
  end

  def students
    subjects.map {|sub| sub.users.select {|usr| usr.profile.tutor == false } }.flatten
  end

  def self.tutors
    joins(:profile).where(:profiles => { :tutor => true })
  end

  def self.students
    joins(:profile).where(:profiles => { :tutor => false })
  end

end
