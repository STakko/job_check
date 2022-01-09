class RecordComment < ApplicationRecord
  belongs_to :shared_users, class_name: 'SharedUser', foreign_key: 'shared_user_id', optional: true
  belongs_to :admins, class_name: 'Admin', foreign_key: 'admin_id', optional: true
  belongs_to :records
end
