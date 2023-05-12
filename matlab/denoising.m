
file_names = ["100","101","103","105","106","108","109","111","112","113",...
    "114","115","116","117","118","119","121","122","123","124","200","201",...
    "202","203","205","207","208","209","210","212","213","214","215","219",...
    "220","221","222","223","228","230","231","232","233","234"];
for idx = 1:length(file_names)
    
    ecg_location =  strcat('mitdb/',file_names(idx));
    ecg_location = convertStringsToChars(ecg_location);
    disp(ecg_location)
    [ecg, Fs, tm] = rdsamp(ecg_location, 1);

    Fc = 0.67;

    fcuts = [(Fc-0.07) (Fc)];
    mags = [0 1];
    devs = [0.005 0.001];

    [n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,Fs);
 
    b = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');
    a = 1;

    ECG_Clean = filtfilt(b,a,ecg);
    save_location = strcat(".\beats\",file_names(idx),'.csv');
    
    csvwrite(save_location,ECG_Clean);
   
end 
