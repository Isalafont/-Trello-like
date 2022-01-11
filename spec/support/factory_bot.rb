# frozen_string_literal: true

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  Rails.application.load_seed
end
