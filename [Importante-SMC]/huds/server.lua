addEventHandler("onPlayerLogin", root,
  function(prev,current)
    triggerClientEvent(source, 'onlogin',root,source)

  end
)

function showhuds(player)
  triggerClientEvent(player,'show',player)

end

function hidehuds(player)
  triggerClientEvent(player,'hide',player)

end