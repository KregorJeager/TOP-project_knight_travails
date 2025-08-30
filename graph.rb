# frozen_string_literal: false

# Graph
class Graph
  def initialize(curr_pos)
    create_graph(curr_pos)
  end

  def create_graph(curr_pos)
    # return arr of all valid (x,y) postion
    que = [Gnode.new(curr_pos)]
    until que.nil?
      n_moves = next_moves(que[0])
      n_moves.each do |move|
        n_node = Gnode.new(move)
        que[0].adj << n_node
        que << n_node
      end
      que.delete_at(0)
    end
  end
end
