class Post < ActiveRecord::Base
  attr_accessible :body, :title,:image, :image_remote_url, :tag_list
  acts_as_taggable
   attr_reader :image_remote_url
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  									:url => "/system/:class/:attachment/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style_:basename.:extension"
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  validates_presence_of :body, :title

  def image_remote_url=(url_value)
  self.image = URI.parse(url_value) unless url_value.blank?
  super
end

end
