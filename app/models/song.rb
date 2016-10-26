class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name], message: "should not happen in the same year by the same artist" }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released, inclusion: {in: 0000...Date.today.year, message: "cannot be released in the future"}

end
