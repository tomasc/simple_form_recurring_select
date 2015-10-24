require 'active_model'
require 'action_controller'
require 'action_view'

require 'bundler/setup'
require 'minitest'
require 'minitest/autorun'
require 'minitest/spec'

require 'ice_cube'

require 'action_view/template'
require 'action_view/test_case'

module Rails
  def self.env
    ActiveSupport::StringInquirer.new("test")
  end
end

require 'simple_form_recurring_select'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

if ENV["CI"]
  require "coveralls"
  Coveralls.wear!
end

# =====================================================================

class MyDocument
  include SimpleFormRecurringSelect::HasRecurringSelect
  has_recurring_select
end
