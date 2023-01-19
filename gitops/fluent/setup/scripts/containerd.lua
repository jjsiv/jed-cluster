function containerd(tag, timestamp, record)
    if(record["logtag"]~=nil) then
        timeStr = os.date("!*t",  timestamp["sec"])
        t = string.format("%4d-%02d-%02dT%02d:%02d:%02d.%sZ",

        timeStr["year"], timeStr["month"], timeStr["day"],
        timeStr["hour"], timeStr["min"], timeStr["sec"],
        timestamp["nsec"]);
        record["time"] = t;
        record["log"] = record["message"];
        record["message"] =  nil;
        return 1, timestamp, record
     else
        return 0, timestamp, record
    end
end