# TOP-project_knight_travails
Find the shortest path a knight needs to reach the target position.

Initial idea is to to determine the next moves from the current postion,
recursively do the same from that position to create a graph. Then create
an algorithm to traverse the graph and find the shortest path to the target 
postion.

The center of the graph will be the given current position. Then it will create
a sort of first layer, which are the next valid move from the current position.
These next move will be put in queue. The first item of the queue will create it's 
next valid position then add them to the queue. This is the second layer. Then 
returns to the first layer to get the next node in queue. 
