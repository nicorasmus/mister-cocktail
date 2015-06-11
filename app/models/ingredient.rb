class Ingredient < ActiveRecord::Base
  has_many :doses

  validates :name, presence: true
  validates :name, uniqueness: true

  def destroy
    raise "Cannot delete" unless doses.count == 0
    super
  end
end
