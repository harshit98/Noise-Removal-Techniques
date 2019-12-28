clc;
clear variables;
close all;

filename = 'baboon.png';

img = imread(filename);
img_expo = imread(fullfile('Exponential', filename));
per_expo = try_all_filter(img_expo,img);
[p,word] = best_filter(per_expo);
%disp(['',word,'is the best with per error=',p])
fprintf("For Exponential noise %s is the best with per error=%f\n",word,p)

img_gaus = imread(fullfile('Gaussian', filename));
per_gaus = try_all_filter(img_gaus,img);
[p,word] = best_filter(per_gaus);
fprintf("For Gaussian noise %s is the best with per error=%f\n",word,p)

img_ray = imread(fullfile('Rayleigh', filename));
per_ray = try_all_filter(img_ray,img);
[p,word] = best_filter(per_ray);
fprintf("For Rayleigh noise %s is the best with per error=%f\n",word,p)

img_sal_pep = imread(fullfile('salt&pep', filename));
per_sal_pep = try_all_filter(img_sal_pep,img);
[p,word] = best_filter(per_sal_pep);
fprintf("For salt&pep noise %s is the best with per error=%f\n",word,p)

img_uni = imread(fullfile('Uniform', filename));
per_uni = try_all_filter(img_uni,img);
[p,word] = best_filter(per_uni);
fprintf("For Uniform noise %s is the best with per error=%f\n",word,p)

per_f = [per_expo;per_gaus;per_ray;per_sal_pep;per_uni];

% For all the files
clc;
clear variables;
close all;

myDir = 'E:\LNMIIT_Study\Sem 7\IIP\Project\Images';
myFiles = dir(fullfile(myDir,'*.png')); %gets all wav files in struct
p = [];
tot_per = zeros(5,9);
for k = 1:length(myFiles)
  baseFileName = myFiles(k).name;
  fullFileName = fullfile(myDir, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  filename = baseFileName;
  img = imread(filename);
    img_expo = imread(fullfile('Exponential', filename));
    per_expo = try_all_filter(img_expo,img);
    [p,word] = best_filter(per_expo);
    %disp(['',word,'is the best with per error=',p])
    fprintf("For Exponential noise %s is the best with per error=%f\n",word,p)

    img_gaus = imread(fullfile('Gaussian', filename));
    per_gaus = try_all_filter(img_gaus,img);
    [p,word] = best_filter(per_gaus);
    fprintf("For Gaussian noise %s is the best with per error=%f\n",word,p)

    img_ray = imread(fullfile('Rayleigh', filename));
    per_ray = try_all_filter(img_ray,img);
    [p,word] = best_filter(per_ray);
    fprintf("For Rayleigh noise %s is the best with per error=%f\n",word,p)

    img_sal_pep = imread(fullfile('salt&pep', filename));
    per_sal_pep = try_all_filter(img_sal_pep,img);
    [p,word] = best_filter(per_sal_pep);
    fprintf("For salt&pep noise %s is the best with per error=%f\n",word,p)

    img_uni = imread(fullfile('Uniform', filename));
    per_uni = try_all_filter(img_uni,img);
    [p,word] = best_filter(per_uni);
    fprintf("For Uniform noise %s is the best with per error=%f\n",word,p)

    per_f = [per_expo;per_gaus;per_ray;per_sal_pep;per_uni];
    tot_per = tot_per+per_f;
end

tot_per = tot_per/20;

save tot_per.mat
