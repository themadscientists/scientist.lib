local gMetaData = game:GetService('HttpService'):JSONDecode(readfile('scientist.lib/bedwars/GameMeta.json'));

local GameMeta = {};
function GameMeta.getItemMeta()
    return gMetaData;
end
function GameMeta.getGameModeData(name: string)
    for index, value in gMetaData.GameMeta do
        if index == name then
            return value;
        end
    end

    return nil;
end

return GameMeta;