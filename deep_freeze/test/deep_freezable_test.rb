require 'minitest/autorun'
require './lib/bank'
require './lib/team'


class DeepFreezableTest < MiniTest::Test
  def test_deep_freeze_to_array
    assert_equal ['Japan', 'US', 'India'], Team::COUNTRIES
    assert Team::COUNTRIES.frozen?
    assert Team::COUNTRIES.all? {|country| country.frozen?}
  end

  def test_deep_freeze_to_hash
    assert_equal({'Japan' => 'yen', 'US' => 'dollar','India' => 'rupee'}, Bank::CURRENCIES)
    assert Bank::CURRENCIES.frozen?
    assert Bank::CURRENCIES.all? {|country, passage| country.frozen? && passage.frozen?}
  end
end
