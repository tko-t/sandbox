class Accounts::Create < Service
  def self.account_attrs
    %i[email password password_confirmation slug]
  end

  def self.profile_attrs
    %i[birthday first_name last_name gender zip country_id city_id address]
  end

  attr_accessor *account_attrs
  attr_accessor *profile_attrs
  attr_reader :account

  def run!
    ActiveRecord::Base.transaction do
      @account = Account.create!(attr_to_h(self.class.account_attrs))
      @profile = Profile.create!(attr_to_h(self.class.profile_attrs).merge(account: @account))
    end
  end
end
