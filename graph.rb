# frozen_string_literal: false

require relative 'graph_node'

# Graph
class Graph
  def initialize(curr_pos)
    create_graph(curr_pos)
  end

  def create_graph(curr_pos)
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

  # Connect two nodes unless there is already a connection
  def connect(node0, node1)
    node0.adj << node1 unless node0.adj.inlude?(node1)
    node1.adj << node0 unless node1.adj.inclue?(node0)
  end
end
