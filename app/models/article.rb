class Article < ActiveRecord::Base
  
  belongs_to :author
  has_many :comments
  
  validates_presence_of :title, :body
  validate :no_cs_in_title
  
  
  def no_cs_in_title
    errors.add :title, 'cannot have the letter C' if title.include?('c')
  end
  
end
