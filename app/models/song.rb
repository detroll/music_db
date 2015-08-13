class Song < ActiveRecord::Base
  belongs_to :artist

  validates :name, :artist_id, presence: true
  validates_uniqueness_of :name, :scope => :artist_id

  scope :recent, -> (minutes_past = 60) {where("created_at > ?", minutes_past.minutes.ago)}
end

# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pretend we also have description, rating
# Indexes
#
#  index_songs_on_artist_id  (artist_id)
#
