local iMetaData = game:GetService('HttpService'):JSONDecode(readfile('scientist.lib/bedwars/ItemMeta.json'));

local ItemMeta = {};
function ItemMeta.getItemMeta()
    return iMetaData;
end
function ItemMeta.getItemData(name: string)
    for index, value in iMetaData.items do
        if index == name then
            return value;
        end
    end

    return nil;
end

return ItemMeta;