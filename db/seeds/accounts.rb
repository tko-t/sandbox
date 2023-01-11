require 'csv'

class AccountMaker
  def addresses
    #addresses = CSV.open('./db/seeds/KEN_ALL_ROME.csv', encoding: 'shift_jis').tap do |csv| rand(1..124541).times { csv.read } end
    @addresses ||= CSV.open('db/seeds/KEN_ALL_ROME.csv', encoding: 'shift_jis', headers: true).readlines.to_a
  end

  def make
    password  = 'password'
    japan     = Country.find_by(name: '日本')
    gender    = Profile.genders.keys.sample.to_sym
    from      = addresses.sample
    to        = addresses.sample
    city_from = japan.cities.find_by(name: from[1])
    city_to   = japan.cities.find_by(name: to[1])

    service = Accounts::Create.run!(
      email: Faker::Internet.email,
      password:,
      password_confirmation: password,
      first_name: Faker::Name.send("#{gender}_first_name"),
      last_name: Faker::Name.last_name,
      birthday:  Faker::Date.between(from: 50.years.ago, to: 18.years.ago),
      gender: gender,
      country_id: japan.id,
      zip: from[0],
      city_id: city_from.id,
      address: "#{from[2,2].join(' ')} #{rand(1..1000)}-#{rand(1..1000)}".gsub(/　/, ' ').strip)
    account = service.account
    puts "1", account.reload.profile.attributes

    Profile::Update.run!(
      account_id: account.id,
      first_name: account.profile.first_name,
      last_name: account.profile.last_name,
      country_id: japan.id,
      zip: to[0],
      city_id: city_to.id,
      address: "#{to[2,2].join(' ')} #{rand(1..1000)}-#{rand(1..1000)}".gsub(/　/, ' ').strip,)
    puts "2", account.reload.profile.attributes

    to        = addresses.sample
    city_to   = japan.cities.find_by(name: to[1])
    Profile::Update.run!(
      account_id: account.id,
      first_name: account.profile.first_name,
      last_name: account.profile.last_name,
      country_id: japan.id,
      zip: to[0],
      city_id: city_to.id,
      address: "#{to[2,2].join(' ')} #{rand(1..1000)}-#{rand(1..1000)}".gsub(/　/, ' ').strip,)

    puts "3", account.reload.profile.attributes
  end
end

maker = AccountMaker.new
(Settings.seed.account_count || 1).times { maker.make }
