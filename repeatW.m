clear  
close all  

clc  



num_repeats =30;

for repeat = 1:num_repeats
    fprintf('Repeat %d\n', repeat);
    
    run('main1.m');
    

r_script_path = 'C:/Users/Victor/Desktop/Fairness machinelearning/Crime/main2.R';
r_executable_path = '"D:\R-4.2.1\bin\Rscript.exe"';


system(['"' r_executable_path '" "' r_script_path '"']);

    
    
 
    run('main3_Wasserstein.m');

    
    
end
