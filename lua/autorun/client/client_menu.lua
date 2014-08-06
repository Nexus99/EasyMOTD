local colors = {
        head = Color(192, 57, 43, 255),
        back = Color(236, 240, 241, 255),
        text = Color(255, 255, 255, 255),
        btn = Color(52, 73, 94, 255),
}
 
 
 
 
surface.CreateFont("menuHead", {font = "OpenSans-Bold", size = 60, weight = 500})
surface.CreateFont("menuBtn", {font = "OpenSans-Regular", size = 30, weight = 500})
surface.CreateFont("menuBtnSmall", {font = "OpenSans-Light", size = 15, weight = 500})
 
local panel = nil;
 
local function menu()
 
        local dframe = vgui.Create("DFrame")
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
                draw.SimpleText("Welcome to SERVER NAME HERE!", "menuHead", dframe:GetWide() / 2, 20, colors.text, TEXT_ALIGN_CENTER)
                dframe:MoveToFront()
        end
 
        panel = dframe;
 
        local HTML = vgui.Create("HTML", dframe)
        HTML:SetSize( ScrW(), ScrH() )
        HTML:Center()
        HTML:SetPos( 0, 100)
        HTML:OpenURL(GetConVarString("easy_url")) --- Your Website Here!
 
        local dbutton = vgui.Create("DButton", dframe)
        dbutton:SetText("")
        dbutton:MoveToFront()
        dbutton:SetSize(250, 50)
        dbutton:SetPos(dframe:GetWide() - 250, dframe:GetTall() - 50)
        dbutton.DoClick = function()
                panel:Close();
        end
 
        dbutton.Paint = function()
                draw.RoundedBox(0, 0, 0, dbutton:GetWide(), dbutton:GetTall(), colors.head);
                draw.SimpleText("Close", "menuBtn", dbutton:GetWide() / 2, 10, colors.text, TEXT_ALIGN_CENTER);
                dbutton:MoveToFront()
        end
 
end
 
local function closemenu()
        if (!panel) then return; end
 
        panel:Remove()
        panel = nil;
end
 
 
 
concommand.Add("open_menu", menu)
concommand.Add("close_menu", closemenu)
