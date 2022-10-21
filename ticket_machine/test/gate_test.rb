require 'minitest/autorun'
require './lib/gate'
require './lib/ticket'

class GateTest < MiniTest::Test
  # def test_gate
  #   umeda = Gate.new(name: :umeda)
  #   juso = Gate.new(name: :juso)
  #   ticket = Ticket.new(fare: 150)
  #   umeda.enter(ticket: ticket)
  #   assert juso.exit(ticket: ticket)
  # end

  def test_umeda_to_mikuni_when_fare_is_not_enough
    umeda = Gate.new(name: :umeda)
    mikuni = Gate.new(name: :mikuni)
    ticket = Ticket.new(fare: 150)
    # ticketにインスタンス変数代入
    umeda.enter(ticket: ticket)
    refute mikuni.exit(ticket: ticket)
  end
end
