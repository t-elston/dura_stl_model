# dura_stl_model
This repo contains a matlab function that allows you to create an STL model of the dura inside of a recording chamber. The function requires a spreadsheet with the following column names:

col - in the worksheet for taking depth measurements, which column letter?
row - in the worksheet, which row number?
X   - exact x coordinate of each hole in the depth grid - get  from OnShape
Y   - exact y coordinate of each hole in depth grid - get from OnShape
protrusion - how much of the polyamide tube used to collect measurements
             protruded from each hole in the depth grid?
tube_len - how long is the polyamide tube used for the manual measurements?
grid_top - what is the z-coordinate of the surface of the depth grid (get from OnShape)
tube_depth - tube_len - protrusion (how far did the tube extend down from the grid_top?)
dura - grid_top - tube_depth (where is the dura at each hole in the depth grid?)

A sample depth measurement worksheet as well as excel file is provided.


