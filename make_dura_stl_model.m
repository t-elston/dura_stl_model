% make_dura_stl_model.m

% Thomas Elston
% 9 Nov 2023
%----------------------------------------------------------------------------------------
% script that loads in an excel file containing the following columns based
% on manually acquired depth measurements
%----------------------------------------------------------------------------------------

% ***
% DETAILS OF REQUIRED SPREADSHEET
% ***
% col - in the worksheet for taking depth measurements, which column letter?
% row - in the worksheet, which row number?
% X   - exact x coordinate of each hole in the depth grid - get  from OnShape
% Y   - exact y coordinate of each hole in depth grid - get from OnShape
% protrusion - how much of the polyamide tube used to collect measurements
%              protruded from each hole in the depth grid?
% tube_len - how long is the polyamide tube used for the manual measurements?
% grid_top - what is the z-coordinate of the surface of the depth grid (get from OnShape)
% tube_depth - tube_len - protrusion (how far did the tube extend down from the grid_top?)
% dura - grid_top - tube_depth (where is the dura at each hole in the depth grid?)

%----------------------------------------------------------------------------------------
% FILE LOCATIONS and DIRECTORIES
% - folder containing the above-detailed spreadsheet
% - STL model will be saved in the same folder
% ***
file_dir = 'C:/Users/Thomas Elston/Documents/MATLAB/Make_dura_depth_STLs/Don/8Nov23_NPX1/';
file_name = 'Don_depth_measures_8Nov23.xlsx';
save_name = 'Don_depth_measures_8Nov23.stl';
%----------------------------------------------------------------------------------------


%import the excel sheet

data = readtable([file_dir file_name]);

% fill in triangles between xy coordingates
DT = delaunay(data.X, data.Y);

% create 3d mesh
TR = triangulation(DT, data.X, data.Y, data.dura);
%[bf, P] = boundaryFacets(TR);

% write mesh to stl file
stlwrite(TR, [file_dir save_name]);
