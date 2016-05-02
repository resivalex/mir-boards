class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
  enum role: { admin: 0, rider: 1 }

  has_attached_file :avatar,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/favicon.ico"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :rider
  end

end
