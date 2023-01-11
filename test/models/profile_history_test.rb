# == Schema Information
#
# Table name: profile_histories
#
#  id         :bigint           not null, primary key
#  address    :string(255)      not null
#  birthday   :date             not null
#  first_name :string(255)      not null
#  full_name  :string(255)
#  gender     :integer          not null
#  last_name  :string(255)      not null
#  zip        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  city_id    :integer          not null
#  country_id :integer          not null
#
# Indexes
#
#  index_city_id_of_profile_history     (city_id)
#  index_country_id_of_profile_history  (country_id)
#  index_full_name_of_profile_history   (full_name)
#  index_name_of_profile_history        (first_name,last_name)
#
require "test_helper"

class ProfileHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
