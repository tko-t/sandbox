# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :integer          not null
#
class City < ApplicationRecord
  belongs_to :country
end
