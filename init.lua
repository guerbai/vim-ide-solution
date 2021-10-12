function LoadMyConfig()
  require('setting')
  require('mapping')
  require('plugins')
end

function ReloadMyConfig()
  for k, _ in pairs(package.loaded) do
    if string.match(k, "^plugins") or k == 'mapping' or k == 'setting' then
      package.loaded[k] = nil
    end
  end
  LoadMyConfig()
end

LoadMyConfig()
