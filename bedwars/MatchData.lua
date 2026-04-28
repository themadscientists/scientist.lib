local MatchData = {
    mapName = workspace:GetAttribute('MapName'),
    gameType = workspace:GetAttribute('GameType'),
    queueType = workspace:GetAttribute('QueueType'),
};

function MatchData:getMapName()
    return self.mapName
end

function MatchData:getQueueType()
    return self.queueType
end

workspace:GetAttributeChangedSignal('MapName'):Connect(function()
    MatchData.mapName = workspace:GetAttribute('MapName')
end)

workspace:GetAttributeChangedSignal('QueueType'):Connect(function()
    MatchData.queueType = workspace:GetAttribute('QueueType')
end)

workspace:GetAttributeChangedSignal('GameType'):Connect(function()
    MatchData.gameType = workspace:GetAttribute('GameType')
end)

return MatchData;