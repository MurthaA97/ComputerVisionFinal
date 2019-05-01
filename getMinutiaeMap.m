function minutiaeMap = getMinutiaeMap(db, display)
    keylist = keys(db);
    minutiaeMap = containers.Map;

    for k = 1:size(keylist, 2)
        minutiae = [];
        key = char(keylist(k));
        files = db(key);
        
        for f = 1:size(files, 2)
            t.minutiae = getAllMinutiae(char(files(f)), display);
            minutiae = [minutiae t];
        end
        
        i.minutiae = minutiae;
        minutiaeMap(key) = i;
    end
end