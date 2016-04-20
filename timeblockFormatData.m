function fileLocationForLCS = timeblockFormatData(filename,current_date_str)
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

for n = 0:64
        
        temp_ds = ds(ds.t == start + hours(3 * n),{'Lat', 'Lon', 'u_vel', 'v_vel'});

        numb = sprintf('%02d', n);
        formattedName = ['velocity', numb,  '.txt'];
        
        %c = int2str(g);
        %formattedName = ['velocity' c '.txt'];
        %g = g + 1;
        export(temp_ds,'file',formattedName,'Delimiter', ' ', 'WriteVarNames', false);

end
display('Download Testing End');
fileLocationForLCS = pwd;
end

