# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/rpn'

# Test validator
class RpnTest < Minitest::Test
  def test_one
    rpn = Rpn.new
    %w[5 8 +].each do |input|
      rpn.read_input(input)
      rpn.calculate
    end
    assert_equal(13, rpn.result)
  end

  def test_two
    rpn = Rpn.new
    rpn.read_input('5 5 5 8 + + -')
    rpn.calculate
    assert_equal(-13.0, rpn.result)

    rpn.read_input('13 +')
    rpn.calculate
    assert_equal(0.0, rpn.result)
  end

  def test_three
    rpn = Rpn.new
    %w[-3 -2 *].each do |input|
      rpn.read_input(input)
      rpn.calculate
    end
    assert_equal(6, rpn.result)

    %w[5 +].each do |input|
      rpn.read_input(input)
      rpn.calculate
    end
    assert_equal(11, rpn.result)
  end

  def test_four
    rpn = Rpn.new
    %w[5 9 1 -].each do |input|
      rpn.read_input(input)
      rpn.calculate
    end
    assert_equal(8, rpn.result)

    rpn.read_input('/')
    rpn.calculate
    assert_equal(0.625, rpn.result)
  end
end
