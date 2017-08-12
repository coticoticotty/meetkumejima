# == Schema Information
#
# Table name: chatboxes
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  user_id    :integer
#  tour_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ChatboxTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
