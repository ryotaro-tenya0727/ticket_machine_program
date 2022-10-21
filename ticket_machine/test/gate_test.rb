require 'minitest/autorun'
require './lib/gate'
require './lib/ticket'

class GateTest < MiniTest::Test
  def setup
    @umeda = Gate.new(name: :umeda)
    @juso = Gate.new(name: :juso)
    @mikuni = Gate.new(name: :mikuni)
  end

  def test_umeda_to_juso
    ticket = Ticket.new(fare: 150)
    # ticketにインスタンス変数代入
    @umeda.enter(ticket: ticket)
    assert @juso.exit(ticket: ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_not_enough
    ticket = Ticket.new(fare: 150)
    # ticketにインスタンス変数代入
    @umeda.enter(ticket: ticket)
    refute @mikuni.exit(ticket: ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(fare: 190)
    # ticketにインスタンス変数代入
    @umeda.enter(ticket: ticket)
    assert @mikuni.exit(ticket: ticket)
  end


  def test_juso_to_mikuni
    ticket = Ticket.new(fare: 150)
    # ticketにインスタンス変数代入
    @juso.enter(ticket: ticket)
    assert @mikuni.exit(ticket: ticket)
  end
end
