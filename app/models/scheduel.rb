class Scheduel < ApplicationRecord
  belongs_to :grade
  
   has_attached_file :image,
                      styles:{slide: "1000x500#", thumb: "65x65#"}

    validates_attachment :image,
                          content_type: { content_type: ["image/jpeg", "image/png"] }
end
