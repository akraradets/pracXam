class User < ApplicationRecord
  has_paper_trail ignore: [:remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at,
    :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at ]
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :ldap_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable
  has_many :discussions
  has_many :upvotes, :class_name => 'DiscussionUpvote', :foreign_key => 'voter'
  has_many :comments, :class_name => 'DiscussionComment', :foreign_key => 'user'
  has_many :user_reports, :class_name => 'UserReport', :foreign_key => 'reporter'
  has_many :papers
  has_many :paper_reports, :class_name => 'PaperReport', :foreign_key => 'reporter'
  has_many :paper_difficulties, :class_name => 'PaperDifficulty', :foreign_key => 'rater'
  has_many :paper_feedbacks, :class_name => 'PaperFeedback', :foreign_key => 'provider'
  has_many :user_reports, :class_name => 'UserReport', :foreign_key => 'reporter'

  def ldap_before_save
    # uid : Student ID
    self.username = Devise::LDAP::Adapter.get_ldap_param(self.username,"uid").first
    # title : CS Master Stuendt
    self.title = Devise::LDAP::Adapter.get_ldap_param(self.username,"title").first
    # gecos : Full name
    self.name = Devise::LDAP::Adapter.get_ldap_param(self.username,"gecos").first
    # employeetype : [student|faculty]
    self.user_type = Devise::LDAP::Adapter.get_ldap_param(self.username,"employeetype").first
    # mail : [list of email]
    self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
  end
end
