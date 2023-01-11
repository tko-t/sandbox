class Profile::Update < Service
  def self.account_attrs
    %i[account_id]
  end

  def self.new_profile_attrs
    %i[first_name last_name zip country_id city_id address]
  end

  attr_accessor *account_attrs
  attr_accessor *new_profile_attrs

  def run!
    ActiveRecord::Base.transaction do
      account         = Account.find(account_id)
      current_profile = account.profile
      profile_history = ProfileHistory.create(current_profile.dup.attributes)
      current_profile.update(attr_to_h(self.class.new_profile_attrs))
    end
  end
end
