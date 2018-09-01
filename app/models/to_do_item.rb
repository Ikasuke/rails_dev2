# == Schema Information
#
# Table name: to_do_items
#
#  id          :bigint(8)        not null, primary key
#  user_id     :integer
#  category_id :integer
#  title       :string(255)
#  start_at    :datetime
#  end_at      :datetime
#  place       :string(255)
#  memo        :text(65535)
#  attachment  :string(255)
#  rank        :integer
#  remind      :boolean          default(FALSE), not null
#  remind_time :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ToDoItem < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  belongs_to :category
end
