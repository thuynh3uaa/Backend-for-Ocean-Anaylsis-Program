function fileLocationForLCS = timeblockFormatData(filename,current_date_str)
%Function that breaks data into smaller files.
%Called after the downloadDataFcn, takes in the date of the data and the
%filename of the data
%Returns the folder location of the data that will be used in the
%Modified_LCS_Calculation_V2 function

%Extract data from CSV file
[DateTime, Lat, Lon, u_vel, v_vel] = csvFormatFcn(filename);


t = datetime(DateTime, 'InputFormat', 'uuuu-MM-dd''T''HH:mm:ss''Z', 'Format', 'yyyy-MM-dd HH:mm:ss');
ds = dataset(t,Lat,Lon,u_vel,v_vel);
start = datetime([current_date_str ' 00:00:00'], 'Format', 'yyyy-MM-dd HH:mm:ss');

%Make a folder to hold the data
h = exist('formatted_data' , 'dir');
if h == 0
    mkdir formatted_data
    cd formatted_data
else
    cd formatted_data
end

j = exist(current_date_str, 'dir');
if j == 0
    mkdir([current_date_str])
    cd ([current_date_str])
else
    cd([current_date_str])
end

%Make files that are 3 hours block each of the original data
for n = 0:64
        
        temp_ds = ds(ds.t == start + hours(3 * n),{'Lat', 'Lon', 'u_vel', 'v_vel'});

        numb = sprintf('%02d', n);
        formattedName = ['velocity', numb,  '.txt'];
        export(temp_ds,'file',formattedName,'Delimiter', ' ', 'WriteVarNames', false);

end
display('Download Testing End');
fileLocationForLCS = pwd;
end

