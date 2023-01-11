# 実装するには slug が必要
# slug は新規作成時に重複しないように差し込まれる
# slug を指定することができる
# slug を変更することができる
# slug でfindすることができる
module Friendable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId

    friendly_id :slug
    before_validation :set_slug, if: :set_slug?

    class << self
      delegate :find, to: :friendly # id でもfindはできる
    end
  end

  def set_slug
    while true do
      SecureRandom.hex(10).tap do |slug|
        self.slug = slug unless self.class.find_by(slug: slug)
      end

      break if self.slug
    end
  end

  def set_slug?
    self.slug.blank?
  end
end
