# frozen_string_literal: false

# A node for graph contains postion(pos) and it's adjacent node(adj)
class Gnode
  attr_accessor :pos, :adj

  def initialize(pos)
    @pos = pos
    @adj = []
  end
end
