# frozen_string_literal: true

# Class: RPN calculator
class Rpn
  VALID_INTEGER_REGEX = /\A[-+]?[0-9]+\z/.freeze
  VALID_OPERATORS = ['+', '-', '*', '/'].freeze

  attr_reader :result

  def initialize
    @calculations = []
  end

  def read_input(input)
    cleaned_input = clean_input(input)
    raise('ERROR: Invalid input') if cleaned_input.empty?

    @items_array = cleaned_input
  end

  def calculate
    @items_array.each do |item|
      if VALID_OPERATORS.include?(item)
        calculate_by_operator(item)
      else
        add_number(item)
      end
    end
    @result = @calculations.last
  end

  private

  def add_number(item)
    @calculations << item
  end

  def calculate_by_operator(item)
    return if @calculations.length < 2

    last_index = @calculations.length - 1
    num_one = @calculations[last_index - 1]
    num_two = @calculations[last_index]
    @calculations[last_index - 1] = eval("#{num_one}#{item}#{num_two * 1.0}")
    @calculations.delete_at(last_index)
  end

  def clean_input(input)
    input.split(' ').select do |i|
      VALID_OPERATORS.include?(i) || (i =~ VALID_INTEGER_REGEX)
    end
  end
end
