local players = game:GetService('Players');
local replStorage = game:GetService('ReplicatedStorage');

replStorage:WaitForChild('Inventories');

local InvCache = {};
local InventoryUtil = {};
function InventoryUtil.getInventory(player: Player)
    if not player then
        return
    end;

    if not InvCache[player.UserId] then
        InvCache[player.UserId] = {};
    end

    table.clear(InvCache[player.UserId]);

    InvCache[player.UserId].items = {};
    InvCache[player.UserId].armor = {};
    InvCache[player.UserId].hand = nil;

    local Inventory = replStorage:FindFirstChild('Inventories'):FindFirstChild(player.Name);
    local HandValue = players.LocalPlayer.Character and players.LocalPlayer.Character:FindFirstChild('HandInvItem') and players.LocalPlayer.Character:FindFirstChild('HandInvItem').Value;

    local ArmorValues = {
        [1] = players.LocalPlayer.Character and players.LocalPlayer.Character:FindFirstChild('ArmorInvItem_0') and players.LocalPlayer.Character:FindFirstChild('ArmorInvItem_0').Value,
        [2] = players.LocalPlayer.Character and players.LocalPlayer.Character:FindFirstChild('ArmorInvItem_1') and players.LocalPlayer.Character:FindFirstChild('ArmorInvItem_1').Value,
        [3] = players.LocalPlayer.Character and players.LocalPlayer.Character:FindFirstChild('ArmorInvItem_2') and players.LocalPlayer.Character:FindFirstChild('ArmorInvItem_2').Value,
    }

    if Inventory then
        for _, value: Instance in Inventory:GetChildren() do
            table.insert(InvCache[player.UserId].items, {
                itemType = value.Name,
                tool = value,
                amount = value:GetAttribute('Amount') or 1,
                itemSkin = value:GetAttribute('ItemSkin'),
                addedToBackpackTime = value:GetAttribute('AddedToBackpackTime') or workspace:GetServerTimeNow(),
            })
        end
    end

    if HandValue then
        InvCache[player.UserId].hand = {
            itemType = HandValue.Name,
            tool = HandValue,
            amount = HandValue:GetAttribute('Amount') or 1,
            itemSkin = HandValue:GetAttribute('ItemSkin'),
            addedToBackpackTime = HandValue:GetAttribute('AddedToBackpackTime') or workspace:GetServerTimeNow(),
        }
    end

    for _, value in ArmorValues do
        if value then
            table.insert(InvCache[player.UserId].armor, {
                itemType = value.Name,
                tool = value,
                amount = value:GetAttribute('Amount') or 1,
                itemSkin = value:GetAttribute('ItemSkin'),
                addedToBackpackTime = value:GetAttribute('AddedToBackpackTime') or workspace:GetServerTimeNow(),
            })
        end
    end

    table.clear(ArmorValues);
    ArmorValues = nil;

    return InvCache[player.UserId];
end

function InventoryUtil.getToolFromInventory(player: Player, toolName: string)
    if not player then
        return
    end;
    
    local itemFound = nil;

    for _, value in InventoryUtil.getInventory(player) do
        if value.itemType == toolName then
            itemFound = value;
            break
        end
    end

    return itemFound;
end

return InventoryUtil;