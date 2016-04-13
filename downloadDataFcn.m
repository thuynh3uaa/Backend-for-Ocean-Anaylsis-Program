function [downloadedFileName, dl_date_str] = downloadDataFcn(downloadLocation,dl_date, lat_s, lat_e, lon_s, lon_e)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global homedir
homedir = pwd;

dl_date_str = datestr(dl_date,'yyyy-mm-dd');
day8= dl_date + days(8);
day8str = datestr(day8,'yyyy-mm-dd');

%%
if lat_e == 90
    lat_e = 89.90947;
end

if lon_s == -180
    lon_s = 74.16;
else
    lon_s = normalToNOAA(lon_s);
end

if lon_e == 180
    lon_e = 434.06227;
else
    lon_e = normalToNOAA(lon_e);
end
%%
lat_start = num2str(lat_s);
lat_stop = num2str(lat_e);
lon_start = num2str(lon_s);
lon_stop = num2str(lon_e);

tz = 'T00:00:00Z';
urlhead = 'http://coastwatch.pfeg.noaa.gov/erddap/griddap/ncepRtofsG2DFore3hrlyProg.csv0?';
url_u_vel = ['u_velocity[(' dl_date_str  '):1:(' day8str  ')][(1.0):1:(1.0)][(' lat_start '):1:(' lat_stop ')][(' lon_start '):1:(' lon_stop ')]'];
url_v_vel = ['v_velocity[(' dl_date_str  '):1:(' day8str  ')][(1.0):1:(1.0)][(' lat_start '):1:(' lat_stop ')][(' lon_start '):1:(' lon_stop ')]'];
url = [urlhead url_u_vel ',' url_v_vel];
downloadedFileName = downloadFromWeb(url,dl_date_str, downloadLocation);
end

function fullFileName = downloadFromWeb(url, dl_date_str, downloadLocation)
global homedir
options = weboptions('Timeout', 60);
% downloadDestination = exist('rawdata' , 'dir');
% if downloadDestination == 0
%     mkdir rawdata
%     cd rawdata
% else
%     cd rawdata
% end
fileName = [downloadLocation '/velocity_from_' dl_date_str '.txt'];
fullFileName = websave(fileName,url,options);
disp('Download Finished');
cd ([homedir])
%FormatData(current_date_str)
end

