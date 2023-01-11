# == Schema Information
#
# Table name: accounts
#
#  id                                                                    :bigint           not null, primary key
#  activated_at(本登録した日時)                                          :datetime
#  admin(管理者アカウントはtrue)                                         :boolean          default(FALSE), not null
#  confirmed(本登録完了でtrue)                                           :boolean          default(FALSE), not null
#  disabled_at(無効にした日時)                                           :datetime
#  email(メールアドレス形式のアカウント)                                 :string(255)      not null
#  last_login_at(最終ログイン日時)                                       :datetime
#  lock_version(楽観ロック用)                                            :integer
#  locked_at(ロックした日時)                                             :datetime
#  onetime_token(一時トークン(本登録・パスワード変更などでの利用を想定)) :string(255)
#  password_digest(ハッシュ化したパスワード)                             :string(255)      not null
#  slug(friendly_id)                                                     :string(255)      not null
#  state(状態: enabled[有効] | disable[無効])                            :string(255)      default("enabled"), not null
#  created_at                                                            :datetime         not null
#  updated_at                                                            :datetime         not null
#
# Indexes
#
#  accounts_email  (email) UNIQUE
#
require "test_helper"

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
