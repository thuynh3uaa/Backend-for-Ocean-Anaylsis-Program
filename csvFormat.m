function [DateTime, Lat, Lon, u_vel, v_vel] = csvFormat(filename)
% pathHead = '/usr/local/MATLAB/R2014b/Research/Tuan_testing/rawdata/velocity_from_';
% dl_date = datetime('now','Format','yyyy-MM-dd');
% current_date_str = datestr(dl_date,'yyyy-mm-dd');
% filename = [pathHead current_date_str '.txt'];



%% Initialize variables.
%filename = '/usr/local/MATLAB/R2014b/Research/Tuan testing/veltest1.txt';
delimiter = ',';

%% Format string for each line of text:
%   column1: text (%s)
%	column3: double (%f)
%   column4: double (%f)
%	column5: double (%f)
%   column6: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%*s%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
DateTime = dataArray{:, 1};
Lat = dataArray{:, 3};
Lon = dataArray{:, 2};
u_vel = dataArray{:, 4};
v_vel = dataArray{:, 5};


disp('Script Done');
%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;
end
