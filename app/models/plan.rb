# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  activity   :string
#  time       :time
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Plan < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
end
