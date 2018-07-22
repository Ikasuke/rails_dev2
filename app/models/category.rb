class Category < ApplicationRecord

   belongs_to :user
   has_many :tp_do_items
end
