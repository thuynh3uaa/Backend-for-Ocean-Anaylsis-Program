function [fullFileName, dl_date_str] = downloadData(downloadLocation,dl_date, lat_s, lat_e, lon_s, lon_e)
%UNTITLED Summary of this function goes here
%   Function that downloads data from NOAA, it needs a folder location,
%   date you wish to download from, the coordinates of the area you want to
%   download. The function will save the data from NOAA into a txt at the
%   folder location. 
%   The function returns the filename of the data and the date of the dataset
%  
global homedir
homedir = pwd;


dl_date_str = datestr(dl_date,'yyyy-mm-dd');
day8= dl_date + days(8);
day8str = datestr(day8,'yyyy-mm-dd');

%% Conversion of signed degrees to NOAA's coordinates to download
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
%% Construction of the URL to download data from NOAA
lat_start = num2str(lat_s);
lat_stop = num2str(lat_e);
lon_start = num2str(lon_s);
lon_stop = num2str(lon_e);

tz = 'T00:00:00Z';
urlhead = 'http://coastwatch.pfeg.noaa.gov/erddap/griddap/ncepRtofsG2DFore3hrlyProg.csv0?';
url_u_vel = ['u_velocity[(' dl_date_str  '):1:(' day8str  ')][(1.0):1:(1.0)][(' lat_start '):1:(' lat_stop ')][(' lon_start '):1:(' lon_stop ')]'];
url_v_vel = ['v_velocity[(' dl_date_str  '):1:(' day8str  ')][(1.0):1:(1.0)][(' lat_start '):1:(' lat_stop ')][(' lon_start '):1:(' lon_stop ')]'];
url = [urlhead url_u_vel ',' url_v_vel];

%Downloading from website

options = weboptions('Timeout', 60);

fileName = [downloadLocation '/velocity_from_' dl_date_str '.txt'];
fullFileName = websave(fileName,url,options);
disp('Download Finished');
cd ([homedir])

end

