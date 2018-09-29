# == Schema Information
#
# Table name: categories
#
#  id             :bigint(8)        not null, primary key
#  user_id        :integer
#  category_name  :string(255)
#  category_color :string(255)
#  background     :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Category < ApplicationRecord
  validates :category_name, presence: true
   belongs_to :user
   has_many :to_do_items, dependent: :destroy
end
