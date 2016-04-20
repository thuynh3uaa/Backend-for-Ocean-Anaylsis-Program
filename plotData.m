function dataPlot(zfolder)
figure(1)
%
load('settings.mat','settings_startF', 'settings_endF')
 g = settings_endF - settings_startF + 1;
% if g == 0 
%      g = g + 1;
% end

cd(zfolder)
    
for n = 1:g
    zfile = ['Z_T', num2str(n), '.mat'];
    load(zfile);
    
    
    slat = str2double(region_y_min);
    nlat = str2double(region_y_max);
    wlon = str2double(region_x_min);
    elon = str2double(region_x_max);
    Z = sigma0';
    
    z1 = min(min(Z)); z2 = max(max(Z));
    color_range = z1:((z2-z1)/11):z2;
    Contours = 10.^color_range;
    
    m_proj('mercator','lat',[slat nlat],'lon',[wlon elon]);
    m_pcolor(xmesh,ymesh,Z),shading flat, hold on
    m_contourf(xmesh,ymesh,Z, color_range),shading flat, hold on
    caxis([0 0.6]), colorbar, colormap();
    m_gshhs_i('patch',[.9 .9 .9]);
    m_grid('linestyle','none','tickdir','out','linewidth',2,'xtick',[wlon:5:elon],'ytick',[slat:5:nlat],'fontsize',10);
    xlabel('X');
    ylabel('Y');
    title('FTLE plot');
    
    
%     Output the contours into pdf and png file
    
    fileextension = '.pdf';
    name = [zfolder,'/image', num2str(n) ,fileextension];
    print('-dpdf',name);
    fileextension = '.png';
    name=[zfolder,'/image', num2str(n) ,fileextension];
    print('-dpng',name);
end
end
