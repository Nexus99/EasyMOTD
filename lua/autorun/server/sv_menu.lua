function OpenMOTDAtSpawn( ply )
		ply:ConCommand( "open_menu" )
end
hook.Add( "PlayerInitialSpawn", "OpenMOTDAtSpawn", OpenMOTDAtSpawn )

CreateConVar("easy_url", "http://google.com/", FCVAR_SERVER_CAN_EXECUTE)

function motdCommand( ply, text, public )
	if (string.sub(text, 1, 6) == "!motd") then
		ply:ConCommand("open_menu")
		return(false)
	end
end
hook.Add("PlayerSay", "ChatCommnad", motdCommand)
