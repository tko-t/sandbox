# see https://railsguides.jp/autoloading_and_reloading_constants.html#活用形をカスタマイズする
Rails.autoloaders.each do |autoloader|
  autoloader.inflector = Zeitwerk::Inflector.new
  autoloader.inflector.inflect(
    "sb" => "SB"
  )
end
