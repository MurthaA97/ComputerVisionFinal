% clear
% clc
% 
% display = 0;
% files = dir('FingerprintImages/');
% files(1:2, :) = [];
% db = containers.Map;
% 
% for f = 1:size(files, 1)
%     file = files(f);
%     key = file.name(1:3);
%     path = string(strcat(file.folder, '\', file.name));
%     if isKey(db, key)
%         db(key) = [db(key) path];
%     else
%         db(key) = path;
%     end
% end
% 
% minutiaeMap = getMinutiaeMap(db, display);

num_templates = 2;
keylist = char(keys(minutiaeMap));
num_keys = size(keylist, 1);
success_rate = containers.Map;
for k = 1:num_keys
    key = keylist(k, :);
    group = minutiaeMap(key);
    
    matches = 0;
    templates = group.minutiae(1:num_templates);
    inputs = group.minutiae(num_templates+1:end);
    num_inputs = size(inputs, 2);
    for i = 1:num_inputs
        S_g = matchMinutiae(templates, inputs(i).minutiae);
        if S_g > 0.43, matches = matches + 1; end
    end
    
    success_rate(key) = (matches / num_inputs) * 100;
end

false_success_rate = containers.Map;
for k = 1:num_keys
    key = keylist(k, :);
    group = minutiaeMap(key);
    
    matches = 0;
    templates = group.minutiae(1:num_templates);
    inputs = group.minutiae(num_templates+1:end);
    num_inputs = size(inputs, 2);
    for i = 1:num_inputs
        S_g = matchMinutiae(templates, inputs(i).minutiae);
        if S_g > 0.43, matches = matches + 1; end
    end
    
    false_success_rate(key) = (matches / num_inputs) * 100;
end







