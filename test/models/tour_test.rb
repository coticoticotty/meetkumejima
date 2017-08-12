# == Schema Information
#
# Table name: tours
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  duration   :string(255)
#  price      :string(255)
#  tour_image :string(255)
#  category   :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
