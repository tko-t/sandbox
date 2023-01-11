class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :slug, null: false, unique: true,          comment: 'friendly_id'
      t.string :email, null: false, unique: true,         comment: 'メールアドレス形式のアカウント'
      t.string :password_digest, null: false,             comment: 'ハッシュ化したパスワード'
      t.boolean :confirmed, null: false, default: :false, comment: '本登録完了でtrue'
      t.string :state, null: false, default: :enabled,    comment: '状態: enabled[有効] | disable[無効]'
      t.string :onetime_token, unique: true,              comment: '一時トークン(本登録・パスワード変更などでの利用を想定)'
      t.boolean :admin, null: false, default: :false,     comment: '管理者アカウントはtrue'
      t.datetime :last_login_at,                          comment: '最終ログイン日時'
      t.datetime :activated_at,                           comment: '本登録した日時'
      t.datetime :locked_at,                              comment: 'ロックした日時'
      t.datetime :disabled_at,                            comment: '無効にした日時'
      t.integer :lock_version,                            comment: '楽観ロック用'
      t.timestamps
    end

    add_index :accounts, [:email], name: :accounts_email, unique: true
  end
end
