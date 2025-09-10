# frozen_string_literal: false

require_relative 'graph_node'

node = Gnode.new([1, 1])
arr = [node]

p arr.include?(node)
