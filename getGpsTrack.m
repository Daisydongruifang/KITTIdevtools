function gpsTrack = getGpsTrack(path)

    format long g
    gpsTrack = [];
    
    gpsDataList = dir([path '/oxts/data/*.txt']);
    
    for iFile = 1:length(gpsDataList)
        
        iFile;
        fid = fopen([path '/oxts/data/' gpsDataList(iFile).name],'r');
        temp = textscan(fid, '%f');
        temp = temp{1};
        gpsTrack = [gpsTrack; [temp(2) temp(1) temp(3)+2]];
        fclose(fid);
        
    end
%     
    fid = fopen('coords.txt', 'w+');
    fprintf(fid, '%.20f,%.20f,%.20f\n', gpsTrack');
    fclose(fid);

end