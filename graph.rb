# frozen_string_literal: false

require relative 'graph_node'

# Graph
class Graph
  def initialize(curr_pos)
    create_graph(curr_pos)
    @all_nodes = []
  end

  def create_graph(curr_pos)
    que = [Gnode.new(curr_pos)]
    until que.nil?
      # next_move will get arr of all valid (x,y) postion of que
      next_moves(que[0]).each do |move|
        # find(move) will return the node given a postion(x,y)
        connect(que[0], find(move)) if already_exsit?(move)
        # Create node given postion(x,y) then connect it with que[0]
        # returns the created node
        que << create_node(que[0], move) unless already_exsit(move)
      end
      @all_nodes << que.delete_at(0)
    end
  end

  # Connect two nodes unless there is already a connection
  def connect(node0, node1)
    node0.adj << node1 unless node0.adj.inlude?(node1)
    node1.adj << node0 unless node1.adj.inclue?(node0)
  end

  def create_node(node, move)
    new_node = Gnode.new(move)
    connect(node, new_node)
    new_node
  end

  def already_exsit?(move)
    @all_nodes.each do |node|
      return true if node.pos == move
    end
    false
  end

  # Will calculate all 8 possible move from a pos even outside of 8x8 grid then filter
  # the valid moves
  def next_moves(node)
    pos = node.pos
    valid_moves = get_8knight_move(pos).filter(&:valid_move?)
  end

  def get_8knight_move(pos)
    [[pos[0] - 1, pos[1] + 2],
     [pos[0] - 1, pos[1] - 2],
     [pos[0] - 2, pos[1] + 1],
     [pos[0] - 2, pos[1] - 1],
     [pos[0] + 1, pos[1] + 2],
     [pos[0] + 1, pos[1] - 2],
     [pos[0] + 2, pos[1] + 1],
     [pos[0] + 2, pos[1] - 1]]
  end

  def valid_move?(pos)
    return true if pos[0] >= 1 || pos[0] <= 8 && pos[1] >= 1 || pos[1] <= 8

    false
  end
end
