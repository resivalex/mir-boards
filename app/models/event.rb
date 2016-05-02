class Event < ActiveRecord::Base
  has_attached_file :photo,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/favicon.ico"
  belongs_to :nomination

  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :photo, matches: [/gif\Z/, /png\Z/, /jpe?g\Z/]
end
