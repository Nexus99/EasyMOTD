local colors = {
	head = Color(192, 57, 43, 255),
	back = Color(236, 240, 241, 255),
	text = Color(255, 255, 255, 255),
	text_blue = Color(52, 152, 219, 255),
	btn = Color(52, 73, 94, 255),
	btn_hover = Color(44, 62, 80, 255),
	btn_disabled = Color(52, 73, 94, 150),
	open = Color(46, 204, 113, 255),
	open_hover = Color(39, 174, 96, 255),
	open_disabled = Color(46, 2014, 113, 150),
	cancel = Color(231, 76, 60, 255),
	cancel_hover = Color(192, 57, 43, 255),
	bar = Color(189, 195, 199, 255),
	barup = Color(127, 140, 141, 255),
	closed = Color(230, 126, 34, 255),
	closed_hover = Color(211, 84, 0, 255),
	info_back = Color(189, 195, 199, 255),
	gray = Color(189, 195, 199, 255),
	gray_hover = Color(127, 140, 141, 255),
}




surface.CreateFont("menuHead", {font = "OpenSans-Bold", size = 60, weight = 500})
surface.CreateFont("menukBtn", {font = "OpenSans-Regular", size = 30, weight = 500})
surface.CreateFont("menuBtnSmall", {font = "OpenSans-Light", size = 15, weight = 500})


function menu()

dframe = vgui.Create("DFrame")
dframe:SetSize(ScrW(), ScrH())
dframe:SetTitle("")
dframe:Center()
dframe:SetDraggable( false )
dframe:MakePopup()
dframe:SetVisible( true )
dframe:ShowCloseButton(false)
dframe.Paint = function()
	draw.RoundedBox(0, 0, 0, dframe:GetWide(), dframe:GetTall(), colors.back)
	draw.RoundedBox(0, 0, 0, dframe:GetWide(), 100, colors.head)
	draw.SimpleText("Welcome to SERVER NAME HERE!", "menuHead", dframe:GetWide() / 2, 20, colors.text, TEXT_ALIGN_CENTER)
end

local HTML = vgui.Create("HTML", dframe)
HTML:SetSize( ScrW(), ScrH() - 150  )
HTML:SetPos( ScrW() - 1922 , ScrH() / 10.7)
HTML:OpenURL("www.gworlds.net")

local dbutton = vgui.Create("DButton", dframe)
dbutton:SetText("")
dbutton:SetSize(250, 50)
dbutton:SetPos(dframe:GetWide() - 250, dframe:GetTall() - 50)
dbutton.DoClick = function()
	dframe:SetVisible( false )
	dframe:MakePopup( false )
	RunConsoleCommand("close_menu")
end

dbutton.Paint = function()
	draw.RoundedBox(0, 0, 0, dbutton:GetWide(), dbutton:GetTall(), colors.head);
	draw.SimpleText("Close", "stockBtn", dbutton:GetWide() / 2, 10, colors.text, TEXT_ALIGN_CENTER);
end


end

function closemenu()
	dframe:SetVisible( false )
	dframe:MakePopup( false )
end



concommand.Add("open_menu", menu)
concommand.Add("close_menu", closemenu)