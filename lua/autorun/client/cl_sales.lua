surface.CreateFont( "Text_Item", {
	font = "Roboto Light",
	size = ScreenScale(12),
	weight = 300,
	antialias = true,
} )

surface.CreateFont( "Text_Buy", {
	font = "Roboto",
	size = ScreenScale(10),
	weight = 400,
	antialias = true,
} )

surface.CreateFont( "Title", {
	font = "Impact Regular",
	size = ScreenScale(16),
	weight = 400,
	antialias = true,
} )

net.Receive("shop_open", function()
	local bg = vgui.Create("DFrame")
	bg:SetSize(ScrW() * 0.5, ScrH() * 0.8)
	bg:Center()
	bg:SetTitle("")
	bg:ShowCloseButton(false)
	bg.Paint = function(self, w, h)
		surface.SetDrawColor(142,68,173)
		surface.DrawRect(0,0,w,h)
	end

	local close = vgui.Create("DButton", bg)
	close:SetSize(bg:GetWide() * 0.1, bg:GetTall() * 0.05)
	close:SetPos(bg:GetWide() * 0.9,0)
	close:SetFont("Impact Regular")
	close:SetTextColor(color(255,255,255))
	close:SetText("X")

	close:Paint = function(self,w,h)
		surface.SetDrawColor(32,32,32)
		surface.DrawRect(0,0,w,h)

	close:DoClick = function()
		bg:Remove()

	end

	local trimz = vgui.Create("DPanel", bg)
	trimz:SetSize(bg:GetWide(), bg:GetTall() * 0.5)
	trimz:SetPos(0, bg:GetTall() * 0.1)
	trimz.Paint = function(self,w,h)
		surface.SetDrawColor(155,89,182)
		surface.DrawRect(0,0,w,h)
	end

	local title = vgui.Create("DLabel", bg)
	title:SetSize(bg:GetWide(), bg:GetTall() * 0.1)
	title:SetPos(0,0)
	title:SetContentAlignment(5)
	title:SetFont("Title")
	title:SetTextColor(color(255,255,255))
	title:SetText("Local Food Supply")

	local scroll = vgui.Create("DScrollPanel", bg)
	scroll:SetSize(bg:GetWide(), bg:GetTall() * 0.85)
	scroll:SetPos(0, trimz.y + trimz:GetTall())

	local sbar = scroll:GetVBar()
		function sbar:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
		end
		function sbar.btnUp:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 32, 32, 32 ) )
		end
		function sbar.btnDown:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 32, 32, 32 ) )
		end
		function sbar.btnGrip:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 233, 233, 233 ) )
		end


	local ypos = 0
	local i = 1

	for k, v in pairs(npc_Item) do
		local row = vgui.Create("DPanel", scroll)
		row:SetSize(row:GetWide(), row:GetTall() * 0.1)
		row:SetPos(0, ypos)
		row.i - i

		row.Paint = function(self,w,h)
			if self.i % 2 == 0 then
				surface.SetDrawColor(52,73,94)
			else
				surface.SetDrawColor(44,62,80)
			end	

			surface.DrawRect(0,0,w,h)

			end

	local ItemName = vgui.Create("DLabel", row)
		ItemName:SetSize(row:GetWide() * 0.4, row:GetTall())
		ItemName:SetPos(row:GetWide() * 0.5, 0)
		ItemName:SetFont("Text_Item")
		ItemName:SetTextColor(255,255,255))
		ItemName:SetText(v.name)

		local buy = vgui.Create(DButton, row)
		buy:SetSize(row:GetWide() * 0.2, row:GetTall() * 0.6 )
		buy:SetPoz(row:GetWide() * 0.75, row:GetTall() * 0.2 )
		buy:setText("BUY")
		buy:SetFont("Text_Buy")
		buy:SetTextColor(255,255,255)
		buy.Paint = function(self,w,h)
			surface.SetDrawColor(142,68,173)
			surface.DrawRect(0,0,w,h)
		end	

		ypos = ypos + row:GetTall()
		i = i + 1
	end


end)