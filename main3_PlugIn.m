clear  
close all  
clc  


%% 
L = 25;
beta = .1;

YLT = load('Data/RF_YLT.csv');
YLF = load('Data/RF_YLF.csv');
YTT = load('Data/RF_YTT.csv');
YTF = load('Data/RF_YTF.csv'); 
SL  = load('Data/SL.csv');
ST  = load('Data/ST.csv');

YTFd = f_dis(YTF,L);
errd = f_err(YTT,YTFd);
faid = f_fai(YTFd,ST);
fprintf('C = 0 - E:%.3f - F:%.3f\n',errd,faid)

YTFd = f_ICML(YLF,YTF,SL,ST,L,beta);
err = f_err(YTT,YTFd);
fai = f_fai(YTFd,ST);
fprintf('C = 1 - E:%.3f - F:%.3f\n',err,fai)

if exist('results_main3_PlugIn.mat', 'file')
    load('results_main3_PlugIn.mat', 'resultsP');
else
    resultsP = [];
end

new_resultsP = struct('err_c0P', errd, 'fai_c0P', faid, 'err_c1P', err, 'fai_c1P', fai);
resultsP = [resultsP, new_resultsP];


save('results_main3_PlugIn.mat', 'resultsP');
