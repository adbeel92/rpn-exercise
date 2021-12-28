#!/usr/bin/env ruby

require './lib/rpn'

@rpn = Rpn.new
@commands = { 'q' => 'exit', 'q!' => 'exit!' }

print "> "
@input = gets.chomp.strip
while !@commands.keys.include?(@input)
  begin
    @rpn.read_input(@input)
    @rpn.calculate

    puts @rpn.result
  rescue => exception
    puts exception
  end
  print "> "
  @input = gets.chomp.strip
end

eval(@commands[@input])
