local qMetaData = game:GetService('HttpService'):JSONDecode(readfile('scientist.lib/bedwars/QueueMeta.json'));

local QueueMeta = {};
function QueueMeta.getItemMeta()
    return qMetaData;
end
function QueueMeta.getGameModeData(name: string)
    for index, value in qMetaData.QueueMeta do
        if index == name then
            return value;
        end
    end

    return nil;
end

return QueueMeta;