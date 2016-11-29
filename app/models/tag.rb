class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags

  validates_uniqueness_of :name
  #they have this v in theirs but I didn't seem to have any issues w/o.
  validates_presence_of :name
end
