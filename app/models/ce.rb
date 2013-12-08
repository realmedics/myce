class Ce < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :cert, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" }
end
