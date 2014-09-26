function [file_list, number_list] = nii_roi_list() 
%Reports names of text files in the template folder
%
%used by nii_nii2mat and nii_stat
pth = fileparts(which(mfilename));
sub = [pth  filesep 'roi' filesep];
fprintf('Using regions of interest from folder %s\n',sub);
s = dir( [sub '*.txt']); %look in 'templates' subdirectory
file_list = {s.name}';
%next, strip .txt
file_list = sort(file_list); %alphabetical order
number_list='';
for i = 1: numel(file_list)
	[~,nam] = fileparts(char(file_list(i)));
	file_list(i)={[sub nam]};
	number_list=[number_list, sprintf('%d',i) '=', nam ' ']; %#ok<AGROW>
end

file_list = char(file_list); %convert to char array
%end nii_listtemplates()