function fileLocationForLCS = timeblockFormatDataFcn(filename,current_date_str)
[DateTime, Lat, Lon, u_vel, v_vel] = csvFormatFcn(filename);

%formatting files after removing comma from csv%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = datetime(DateTime, 'InputFormat', 'uuuu-MM-dd''T''HH:mm:ss''Z', 'Format', 'yyyy-MM-dd HH:mm:ss');
ds = dataset(t,Lat,Lon,u_vel,v_vel);
start = datetime([current_date_str ' 00:00:00'], 'Format', 'yyyy-MM-dd HH:mm:ss');
%start_stamp = datestr(start);
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
%g = 1;
for n = 0:8

   for i = 0:7
        hr = i * 3;
        
        
        temp_ds = ds(ds.t == start + days(n) + hours(hr),{'Lat', 'Lon', 'u_vel', 'v_vel'});
        day = sprintf('%02d' , n);
        hrs = sprintf('%02d' , hr);
        formattedName = ['data from ' current_date_str ' D' day ' Hr' hrs '.txt'];
        
        %c = int2str(g);
        %formattedName = ['velocity' c '.txt'];
        %g = g + 1;
        export(temp_ds,'file',formattedName,'Delimiter', ' ', 'WriteVarNames', false);
        if n == 8
            break;
        end
   end
end
display('Download Testing End');
fileLocationForLCS = pwd;
end

