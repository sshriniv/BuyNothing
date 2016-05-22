class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :posts, :through => :taggings, :source => :taggable, :source_type => 'Post'


	def self.tag_counts
      Tag.select("tags.name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
	end
end
