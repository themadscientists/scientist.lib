safegetgenv = function()
    if getgenv then
        return getgenv()
    else
        return {}
    end
end

local import = function(file: string)
    if typeof(file) ~= 'string' then
        return
    end

    if file == 'importer' then
        return
    end

    local Success, Data = pcall(function()
        return game:HttpGet('https://raw.githubusercontent.com/themadscientists/scientist.lib/refs/heads/main/'..file..'.lua')
    end)

    if not Success then
        return warn('Failed to import ' .. file .. '!')
    end

    return loadstring(Data);
end

shared.import = import
_G.import = import
safegetgenv().import = import
