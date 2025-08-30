# frozen_string_literal: false

require relative 'graph_node'

# Graph
class Graph
  def initialize(curr_pos)
    create_graph(curr_pos)
  end

  def create_graph(curr_pos)
    # return arr of all valid (x,y) postion
    que = [Gnode.new(curr_pos)]
    until que.nil?
      # next_move will get arr of all valid (x,y) postion of que
      next_moves(que[0]).each do |move|
        # find(move) will return the node given a postion(x,y)
        connect(que[0], find(move)) if already_exsit?(move)
        # Create the node give postion(move) then connect it with que[0]
        # returns the created node
        que << create_node(que[0], move) unless already_exsit(move)
      end
      que.delete_at(0)
    end
  end
end
