class Todo < ApplicationRecord
has_many :completeds
has_many :users, through: :completeds
end
