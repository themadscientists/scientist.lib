local ConstantManager = {};

function ConstantManager.registerConstants(parent: Instance, data)
    for index, value in data do
        parent:SetAttribute('ConstantManager_'..index, value);
    end

    return data;
end

function ConstantManager.getConstants(parent: Instance)
    local constData = {}

    for index, value in parent:GetAttributes() do
        constData[index:gsub('ConstantManager_', '')] = value;
    end

    return constData;
end

return ConstantManager;