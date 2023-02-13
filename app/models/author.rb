class Author < ApplicationRecord
  has_many :courses

  before_destroy :redistribute_courses

  validates :firstname, presence: true
  validates :lastname, presence: true

  private
  def redistribute_courses()
    other_author = Author.where.not(id: id).first
    if other_author
      Course.where(author_id: id).update_all(author_id: other_author.id)
    else
      raise "Last author can't be deleted"
    end
  end

end
