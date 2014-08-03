local colors = {
	head = Color(192, 57, 43, 255),
	back = Color(236, 240, 241, 255),
	text = Color(255, 255, 255, 255),
	btn = Color(52, 73, 94, 255),
}




surface.CreateFont("menuHead", {font = "OpenSans-Bold", size = 60, weight = 500})
surface.CreateFont("menuBtn", {font = "OpenSans-Regular", size = 30, weight = 500})
surface.CreateFont("menuBtnSmall", {font = "OpenSans-Light", size = 15, weight = 500})


function menu()




dframe = vgui.Create("DFrame")
dframe:SetSize(ScrW(), ScrH())
dframe:SetTitle("")
dframe:MoveToFront()
dframe:Center()
dframe:SetDraggable( false )
dframe:MakePopup()
dframe:SetVisible( true )
dframe:ShowCloseButton(false)
dframe.Paint = function()
	draw.RoundedBox(0, 0, 0, dframe:GetWide(), dframe:GetTall(), colors.back)
	draw.RoundedBox(0, 0, 0, dframe:GetWide(), 100, colors.head)
	draw.SimpleText("Welcome to the MOTD Test Server!", "menuHead", dframe:GetWide() / 2, 20, colors.text, TEXT_ALIGN_CENTER)
	dframe:MoveToFront()
end

local HTML = vgui.Create("HTML", dframe)
<<<<<<< HEAD
HTML:SetSize( ScrW(), ScrH() )
HTML:Center()
HTML:SetPos( 0, 100)
HTML:OpenURL("http://facepunch.com/showthread.php?t=1414515") --- Your Website Here!
=======
HTML:SetSize( ScrW(), ScrH() - 100  )
HTML:SetPos( ScrW() - 1922 , ScrH() / 10.7)
HTML:OpenURL("www.google.com") --- Your Website Here!
>>>>>>> ad04174be73c3b004e5ce5a5e1db8e44c3211caa

local dbutton = vgui.Create("DButton", dframe)
dbutton:SetText("")
dbutton:MoveToFront()
dbutton:SetSize(250, 50)
dbutton:SetPos(dframe:GetWide() - 250, dframe:GetTall() - 50)
dbutton.DoClick = function()
	dframe:SetVisible( false )
	dframe:MakePopup( false )
	RunConsoleCommand("close_menu")
end

dbutton.Paint = function()
	draw.RoundedBox(0, 0, 0, dbutton:GetWide(), dbutton:GetTall(), colors.head);
<<<<<<< HEAD
	draw.SimpleText("Close", "menuBtn", dbutton:GetWide() / 2, 10, colors.text, TEXT_ALIGN_CENTER);
=======
	draw.SimpleText("Close", "stockBtn", dbutton:GetWide() / 2, 10, colors.text, TEXT_ALIGN_CENTER);
>>>>>>> ad04174be73c3b004e5ce5a5e1db8e44c3211caa
	dbutton:MoveToFront()
end

end

function closemenu()
	dframe:SetVisible( false )
	dframe:MakePopup( false )
end



concommand.Add("open_menu", menu)
concommand.Add("close_menu", closemenu)



