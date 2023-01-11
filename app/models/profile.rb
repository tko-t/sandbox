# == Schema Information
#
# Table name: profiles
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
#  account_id :integer          not null
#  city_id    :integer          not null
#  country_id :integer          not null
#
# Indexes
#
#  index_city_id_of_profile     (city_id)
#  index_country_id_of_profile  (country_id)
#  index_full_name_of_profile   (full_name)
#  index_name_of_profile        (first_name,last_name)
#
class Profile < ApplicationRecord
  belongs_to :account
  belongs_to :country
  belongs_to :city

  enum gender: { male: 0, female: 1 }
end
