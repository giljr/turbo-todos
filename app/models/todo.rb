class Todo < ApplicationRecord
  after_update_commit { broadcast_append_to "todos" }
  validates :title, presence: true

  enum :status, [ :incomplete, :complete ]
end
