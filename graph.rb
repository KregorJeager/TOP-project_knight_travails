# frozen_string_literal: false

require_relative 'graph_node'
require 'pry-byebug'

# Graph
class Graph
  attr_accessor :node

  def initialize(curr_pos)
    @node = Gnode.new(curr_pos)
    @all_nodes = [] << node
    create_graph(@node)
    p @all_nodes.length
  end

  def create_graph(node)
    que = [] << node
    until que.empty?
      # next_move will get arr of all valid (x,y) postion of que
      next_moves(que[0]).each do |move|
        # find(move) will return the node given a postion(x,y)
        connect(que[0], find(move)) if already_exist?(move)
        # Create node given postion(x,y) then connect it with que[0]
        # returns the created node
        que << create_node(que[0], move) unless already_exist?(move)
      end
      @all_nodes << que.delete_at(0)
    end
  end

  # Connect two nodes unless there is already a connection
  def connect(node0, node1)
    node0.adj << node1 unless node0.adj.include?(node1)
    node1.adj << node0 unless node1.adj.include?(node0)
  end

  def create_node(node, move)
    new_node = Gnode.new(move)
    connect(node, new_node)
    new_node
  end

  def already_exist?(move)
    @all_nodes.each do |node|
      return true if node.pos == move
    end
    false
  end

  # Will calculate all 8 possible move from a pos even outside of 8x8 grid then filter
  # the valid moves
  def next_moves(node)
    return [] if node.nil?

    get_8knight_move(node.pos).filter { |pos| valid_move?(pos) }
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
    return true if pos[0] >= 0 && pos[0] <= 7 && pos[1] >= 0 && pos[1] <= 7

    false
  end

  def find(move)
    @all_nodes.filter { |node| node.pos == move }.at(0)
  end
end

grp = Graph.new([0, 0])
