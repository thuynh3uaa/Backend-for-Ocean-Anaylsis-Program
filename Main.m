function Main
%Script that runs the function for downloading, formatting, and LCS
%calculations
homefolder = pwd;
load('settings.mat');
cd (settings_folderLocation)
%Run data download from NOAA Function
%Takes in 4 parameters, Lattitude & Longitude Start and End from the
%Settings File.
dl_date = datetime('now','Format','yyyy-MM-dd');
dl_date = dl_date - days(1);
[filename,current_date_str] = downloadData(settings_folderLocation, dl_date,...
    settings_latStart,settings_latEnd,...
    settings_longStart, settings_longEnd);
disp(filename);
fileLocationForLCS = timeblockFormatData(filename, current_date_str);
cd (homefolder)
Modified_LCS_Calculation_V2(fileLocationForLCS);
cd (homefolder)
zfiles = [fileLocationForLCS, '/MatFiles/'];
plotData(zfiles);
cd (homefolder);

