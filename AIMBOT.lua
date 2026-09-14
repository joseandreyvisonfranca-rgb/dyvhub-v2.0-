--==================================================
-- DYV HUB v2.0 - MOBILE EDITION
-- 8 Abas: Players, Jogador, Funções, Mira, Música, Preferências, Outros, Créditos
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local GREEN = Color3.fromRGB(50, 255, 120)
local GREEN_DARK = Color3.fromRGB(10, 40, 20)
local GREEN_BTN = Color3.fromRGB(0, 90, 45)
local GREEN_LIGHT = Color3.fromRGB(0, 255, 130)
local WHITE = Color3.fromRGB(255, 255, 255)
local DARK = Color3.fromRGB(8, 12, 10)
local BLACK = Color3.fromRGB(3, 5, 4)
local RED = Color3.fromRGB(255, 80, 80)

local FONTE = Enum.Font.Arial
local FONTE_BOLD = Enum.Font.ArialBold

local ICONE = "rbxassetid://111463279075431"

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "DYV_HUB"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

-- INTRO
local intro = Instance.new("Frame")
intro.Size = UDim2.fromScale(1, 1)
intro.BackgroundColor3 = BLACK
intro.BackgroundTransparency = 1
intro.ZIndex = 999
intro.Parent = gui

local introText = Instance.new("TextLabel")
introText.Size = UDim2.fromScale(1, 1)
introText.BackgroundTransparency = 1
introText.Text = "DYV HUB"
introText.TextColor3 = GREEN
introText.TextScaled = true
introText.Font = FONTE_BOLD
introText.TextTransparency = 1
introText.ZIndex = 1000
introText.Parent = gui

TweenService:Create(intro, TweenInfo.new(1.5), {BackgroundTransparency = 0}):Play()
TweenService:Create(introText, TweenInfo.new(1.5), {TextTransparency = 0}):Play()
task.wait(5)
TweenService:Create(intro, TweenInfo.new(1.5), {BackgroundTransparency = 1}):Play()
TweenService:Create(introText, TweenInfo.new(1.5), {TextTransparency = 1}):Play()
task.wait(1.6)
intro:Destroy()
introText:Destroy()

-- MENSAGENS
task.spawn(function()
	local container = Instance.new("Frame")
	container.Size = UDim2.fromOffset(280, 105)
	container.Position = UDim2.fromOffset(15, 15)
	container.BackgroundTransparency = 1
	container.ZIndex = 100
	container.Parent = gui

	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 5)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = container

	local mensagens = {
		"✋  você executou DYV HUB",
		"⚠️  use com moderação",
		"💬  discord: https://discord.gg/4RqVr27N"
	}

	local labels = {}

	for i, msg in ipairs(mensagens) do
		local label = Instance.new("TextLabel")
		label.Size = UDim2.fromOffset(280, 25)
		label.BackgroundColor3 = BLACK
		label.BackgroundTransparency = 1
		label.Text = msg
		label.TextColor3 = GREEN
		label.TextSize = 13
		label.Font = FONTE_BOLD
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.TextTransparency = 1
		label.ZIndex = 101
		label.LayoutOrder = i
		label.Parent = container

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 8)
		corner.Parent = label

		local stroke = Instance.new("UIStroke")
		stroke.Color = GREEN
		stroke.Thickness = 1
		stroke.Transparency = 1
		stroke.Parent = label

		table.insert(labels, {label = label, stroke = stroke})
	end

	for i, obj in ipairs(labels) do
		task.spawn(function()
			task.wait((i - 1) * 0.4)
			TweenService:Create(obj.label, TweenInfo.new(0.6), {
				TextTransparency = 0.15,
				BackgroundTransparency = 0.55
			}):Play()
			TweenService:Create(obj.stroke, TweenInfo.new(0.6), {Transparency = 0.4}):Play()
		end)
	end

	task.wait(10)

	for i, obj in ipairs(labels) do
		task.spawn(function()
			task.wait((i - 1) * 0.2)
			TweenService:Create(obj.label, TweenInfo.new(1), {
				TextTransparency = 1,
				BackgroundTransparency = 1
			}):Play()
			TweenService:Create(obj.stroke, TweenInfo.new(1), {Transparency = 1}):Play()
		end)
	end

	task.wait(2)
	container:Destroy()
end)

-- MENU PRINCIPAL
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(100, 80)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = DARK
main.Parent = gui

TweenService:Create(main, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	Size = UDim2.fromOffset(520, 360)
}):Play()

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = main

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 45, 30)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 20, 14)),
})
gradient.Rotation = 45
gradient.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = GREEN
mainStroke.Thickness = 2
mainStroke.Transparency = 0.2
mainStroke.Parent = main

task.spawn(function()
	while mainStroke.Parent do
		for i = 0, 1, 0.05 do
			mainStroke.Transparency = 0.2 + (0.5 * i)
			task.wait(0.03)
		end
		for i = 0, 1, 0.05 do
			mainStroke.Transparency = 0.7 - (0.5 * i)
			task.wait(0.03)
		end
	end
end)

-- BARRA VERDE
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 42)
topBar.BackgroundColor3 = GREEN_DARK
topBar.BackgroundTransparency = 0
topBar.BorderSizePixel = 0
topBar.ZIndex = 5
topBar.Parent = main

local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 18)
topBarCorner.Parent = topBar

local topBarGrad = Instance.new("UIGradient")
topBarGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 180, 80)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 130)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 180, 80)),
})
topBarGrad.Rotation = 90
topBarGrad.Parent = topBar

local topBarStroke = Instance.new("UIStroke")
topBarStroke.Color = GREEN_LIGHT
topBarStroke.Thickness = 2
topBarStroke.Transparency = 0.2
topBarStroke.Parent = topBar

task.spawn(function()
	while topBarStroke.Parent do
		for i = 0, 1, 0.1 do
			topBarStroke.Transparency = 0.2 + (0.4 * i)
			task.wait(0.05)
		end
		for i = 0, 1, 0.1 do
			topBarStroke.Transparency = 0.6 - (0.4 * i)
			task.wait(0.05)
		end
	end
end)

local nomeHub = Instance.new("TextLabel")
nomeHub.Size = UDim2.fromOffset(150, 42)
nomeHub.Position = UDim2.fromOffset(20, 0)
nomeHub.BackgroundTransparency = 1
nomeHub.Text = "DYV HUB"
nomeHub.TextColor3 = WHITE
nomeHub.TextSize = 18
nomeHub.Font = FONTE_BOLD
nomeHub.TextXAlignment = Enum.TextXAlignment.Left
nomeHub.ZIndex = 6
nomeHub.Parent = topBar

-- LUPA
local searchBtn = Instance.new("TextButton")
searchBtn.Size = UDim2.fromOffset(30, 30)
searchBtn.Position = UDim2.new(1, -42, 0.5, -15)
searchBtn.BackgroundColor3 = BLACK
searchBtn.BackgroundTransparency = 0.3
searchBtn.Text = "🔍"
searchBtn.TextColor3 = WHITE
searchBtn.TextSize = 16
searchBtn.Font = FONTE_BOLD
searchBtn.AutoButtonColor = false
searchBtn.ZIndex = 6
searchBtn.Parent = topBar

local searchBtnCorner = Instance.new("UICorner")
searchBtnCorner.CornerRadius = UDim.new(0, 10)
searchBtnCorner.Parent = searchBtn

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -20, 0, 35)
searchBox.Position = UDim2.fromOffset(10, 46)
searchBox.BackgroundColor3 = BLACK
searchBox.BackgroundTransparency = 0.1
searchBox.Text = ""
searchBox.PlaceholderText = "🔍  Pesquisar na aba atual..."
searchBox.PlaceholderColor3 = Color3.fromRGB(130, 130, 130)
searchBox.TextColor3 = WHITE
searchBox.TextSize = 13
searchBox.Font = FONTE
searchBox.ClearTextOnFocus = false
searchBox.Visible = false
searchBox.ZIndex = 7
searchBox.Parent = main

local searchBoxCorner = Instance.new("UICorner")
searchBoxCorner.CornerRadius = UDim.new(0, 10)
searchBoxCorner.Parent = searchBox

local searchBoxStroke = Instance.new("UIStroke")
searchBoxStroke.Color = GREEN_LIGHT
searchBoxStroke.Thickness = 1.5
searchBoxStroke.Transparency = 0.3
searchBoxStroke.Parent = searchBox

local searchOpen = false

searchBtn.MouseButton1Click:Connect(function()
	searchOpen = not searchOpen
	searchBox.Visible = searchOpen
	if searchOpen then
		searchBox:CaptureFocus()
	end
end)

-- SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.fromOffset(150, 1)
sidebar.Position = UDim2.fromOffset(0, 46)
sidebar.BackgroundColor3 = GREEN_DARK
sidebar.BackgroundTransparency = 0.1
sidebar.BorderSizePixel = 0
sidebar.Parent = main

task.spawn(function()
	task.wait(0.7)
	sidebar.Size = UDim2.new(0, 150, 1, -46)
end)

local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 18)
sidebarCorner.Parent = sidebar

local sidebarGrad = Instance.new("UIGradient")
sidebarGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 60, 30)),
	ColorSequenceKeypoint.new(1, GREEN_DARK),
})
sidebarGrad.Rotation = 90
sidebarGrad.Parent = sidebar

-- ÁREA DE CONTEÚDO
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -165, 1, -60)
content.Position = UDim2.fromOffset(155, 52)
content.BackgroundTransparency = 1
content.Parent = main

local contentTitle = Instance.new("TextLabel")
contentTitle.Size = UDim2.new(1, -20, 0, 25)
contentTitle.Position = UDim2.fromOffset(10, 0)
contentTitle.BackgroundTransparency = 1
contentTitle.Text = "PLAYERS"
contentTitle.TextColor3 = GREEN
contentTitle.TextSize = 14
contentTitle.Font = FONTE_BOLD
contentTitle.TextXAlignment = Enum.TextXAlignment.Left
contentTitle.Parent = content

local contentLine = Instance.new("Frame")
contentLine.Size = UDim2.new(1, -20, 0, 2)
contentLine.Position = UDim2.fromOffset(10, 27)
contentLine.BackgroundColor3 = GREEN
contentLine.BorderSizePixel = 0
contentLine.Parent = content

local contentLineGrad = Instance.new("UIGradient")
contentLineGrad.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.5, 0.2),
	NumberSequenceKeypoint.new(1, 1),
})
contentLineGrad.Parent = contentLine

local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -20, 1, -35)
contentArea.Position = UDim2.fromOffset(10, 32)
contentArea.BackgroundTransparency = 1
contentArea.ClipsDescendants = true
contentArea.Parent = content

-- SISTEMA DE ABAS
local sidebarButtons = {}
local currentTabIndex = 1

local function clearContent()
	for _, child in ipairs(contentArea:GetChildren()) do
		child:Destroy()
	end
end

local function selectTab(index, titulo)
	currentTabIndex = index
	for i, data in ipairs(sidebarButtons) do
		if i == index then
			TweenService:Create(data.btn, TweenInfo.new(0.25), {BackgroundTransparency = 0.3}):Play()
			TweenService:Create(data.stroke, TweenInfo.new(0.25), {Transparency = 0}):Play()
			data.label.TextColor3 = GREEN
		else
			TweenService:Create(data.btn, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
			TweenService:Create(data.stroke, TweenInfo.new(0.25), {Transparency = 1}):Play()
			data.label.TextColor3 = Color3.fromRGB(140, 180, 155)
		end
	end
	contentTitle.Text = titulo
	clearContent()
end

local function createSidebarButton(text, y, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -16, 0, 30)
	btn.Position = UDim2.fromOffset(8, y)
	btn.BackgroundColor3 = BLACK
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.AutoButtonColor = false
	btn.Parent = sidebar

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 10)
	btnCorner.Parent = btn

	local btnStroke = Instance.new("UIStroke")
	btnStroke.Color = GREEN
	btnStroke.Thickness = 1
	btnStroke.Transparency = 1
	btnStroke.Parent = btn

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -16, 1, 0)
	label.Position = UDim2.fromOffset(8, 0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Color3.fromRGB(140, 180, 155)
	label.TextSize = 12
	label.Font = FONTE_BOLD
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = btn

	btn.MouseEnter:Connect(function()
		if btnStroke.Transparency > 0.5 then
			TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.7}):Play()
		end
	end)
	btn.MouseLeave:Connect(function()
		if btnStroke.Transparency > 0.5 then
			TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
		end
	end)

	btn.MouseButton1Click:Connect(callback)
	table.insert(sidebarButtons, {btn = btn, stroke = btnStroke, label = label})
	return btn
end

-- FUNÇÕES REUTILIZÁVEIS
local function inputBox(titulo, placeholder, callback)
	local panel = Instance.new("Frame")
	panel.Size = UDim2.fromOffset(280, 120)
	panel.Position = UDim2.fromScale(0.5, 0.5)
	panel.AnchorPoint = Vector2.new(0.5, 0.5)
	panel.BackgroundColor3 = DARK
	panel.ZIndex = 90
	panel.Parent = gui

	local pc = Instance.new("UICorner"); pc.CornerRadius = UDim.new(0, 14); pc.Parent = panel
	local ps = Instance.new("UIStroke"); ps.Color = GREEN; ps.Thickness = 2; ps.Transparency = 0.2; ps.Parent = panel

	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, -20, 0, 25)
	title.Position = UDim2.fromOffset(10, 5)
	title.BackgroundTransparency = 1
	title.Text = titulo
	title.TextColor3 = GREEN
	title.TextSize = 13
	title.Font = FONTE_BOLD
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.ZIndex = 91
	title.Parent = panel

	local close = Instance.new("TextButton")
	close.Size = UDim2.fromOffset(28, 28)
	close.Position = UDim2.new(1, -33, 0, 3)
	close.BackgroundTransparency = 1
	close.Text = "X"
	close.TextColor3 = GREEN
	close.TextSize = 13
	close.Font = FONTE_BOLD
	close.ZIndex = 91
	close.Parent = panel
	close.MouseButton1Click:Connect(function() panel:Destroy() end)

	local input = Instance.new("TextBox")
	input.Size = UDim2.new(1, -20, 0, 35)
	input.Position = UDim2.fromOffset(10, 35)
	input.BackgroundColor3 = BLACK
	input.TextColor3 = GREEN
	input.PlaceholderText = placeholder
	input.PlaceholderColor3 = Color3.fromRGB(130,130,130)
	input.TextSize = 13
	input.Font = FONTE
	input.ClearTextOnFocus = false
	input.ZIndex = 91
	input.Parent = panel
	local ic = Instance.new("UICorner"); ic.CornerRadius = UDim.new(0, 10); ic.Parent = input

	local confirm = Instance.new("TextButton")
	confirm.Size = UDim2.new(1, -20, 0, 32)
	confirm.Position = UDim2.fromOffset(10, 78)
	confirm.BackgroundColor3 = GREEN_BTN
	confirm.Text = "CONFIRMAR"
	confirm.TextColor3 = WHITE
	confirm.TextSize = 13
	confirm.Font = FONTE_BOLD
	confirm.ZIndex = 91
	confirm.Parent = panel
	local cfc = Instance.new("UICorner"); cfc.CornerRadius = UDim.new(0, 10); cfc.Parent = confirm
	local cfs = Instance.new("UIStroke"); cfs.Color = GREEN; cfs.Thickness = 1; cfs.Parent = confirm

	input:CaptureFocus()
	confirm.MouseButton1Click:Connect(function()
		callback(input.Text)
		panel:Destroy()
	end)
end

local function findPlayer(text)
	text = text:lower()
	if #text < 4 then return nil end
	for _, target in ipairs(Players:GetPlayers()) do
		if target ~= player then
			if target.Name:lower():sub(1, #text) == text
				or target.DisplayName:lower():sub(1, #text) == text then
				return target
			end
		end
	end
	return nil
end

-- BOTÃO 3D
local function makeBtn3D(parent, text, descricao)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1, -6, 0, 45)
	b.BackgroundColor3 = GREEN_BTN
	b.Text = ""
	b.AutoButtonColor = false
	b.Parent = parent

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 12)
	c.Parent = b

	local grad = Instance.new("UIGradient")
	grad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 110, 55)),
		ColorSequenceKeypoint.new(1, GREEN_BTN),
	})
	grad.Rotation = 90
	grad.Parent = b

	local s = Instance.new("UIStroke")
	s.Color = GREEN
	s.Thickness = 1.5
	s.Transparency = 0.2
	s.Parent = b

	local shadow = Instance.new("Frame")
	shadow.Size = UDim2.new(1, -6, 0, 45)
	shadow.Position = UDim2.new(0, 3, 0, 3)
	shadow.BackgroundColor3 = BLACK
	shadow.BackgroundTransparency = 0.6
	shadow.BorderSizePixel = 0
	shadow.ZIndex = b.ZIndex - 1
	shadow.Parent = parent

	local sc = Instance.new("UICorner")
	sc.CornerRadius = UDim.new(0, 12)
	sc.Parent = shadow

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -16, 0, 20)
	label.Position = UDim2.new(0, 12, 0, 6)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = WHITE
	label.TextSize = 13
	label.Font = FONTE_BOLD
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = b

	local desc = Instance.new("TextLabel")
	desc.Size = UDim2.new(1, -16, 0, 14)
	desc.Position = UDim2.new(0, 12, 0, 25)
	desc.BackgroundTransparency = 1
	desc.Text = descricao or ""
	desc.TextColor3 = Color3.fromRGB(200, 255, 220)
	desc.TextSize = 10
	desc.Font = FONTE
	desc.TextXAlignment = Enum.TextXAlignment.Left
	desc.Parent = b

	b.MouseEnter:Connect(function()
		TweenService:Create(b, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(0, 140, 70) }):Play()
	end)
	b.MouseLeave:Connect(function()
		TweenService:Create(b, TweenInfo.new(0.15), { BackgroundColor3 = GREEN_BTN }):Play()
	end)

	return b, label, desc
end

-- REGISTRO PRA LUPA
local currentTabButtons = {}

local function registrarBotao(nome, descricao, btn)
	table.insert(currentTabButtons, {
		nome = nome,
		descricao = descricao,
		btn = btn
	})
end

local function limparRegistros()
	currentTabButtons = {}
end

-- ABA: PLAYERS
local selectedPlayer = nil
local playerRows = {}

local function buildPlayersList()

	clearContent()
	limparRegistros()
	playerRows = {}
	selectedPlayer = nil

	local scrollP = Instance.new("ScrollingFrame")
	scrollP.Size = UDim2.new(1, 0, 1, -55)
	scrollP.BackgroundTransparency = 1
	scrollP.BorderSizePixel = 0
	scrollP.ScrollBarThickness = 4
	scrollP.ScrollBarImageColor3 = GREEN
	scrollP.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollP.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollP.Parent = contentArea

	local listLayout = Instance.new("UIListLayout")
	listLayout.Padding = UDim.new(0, 5)
	listLayout.Parent = scrollP

	local titleList = Instance.new("TextLabel")
	titleList.Size = UDim2.new(1, 0, 0, 20)
	titleList.BackgroundTransparency = 1
	titleList.Text = "PLAYERS NO SERVIDOR"
	titleList.TextColor3 = GREEN
	titleList.TextSize = 11
	titleList.Font = FONTE_BOLD
	titleList.TextXAlignment = Enum.TextXAlignment.Left
	titleList.LayoutOrder = 0
	titleList.Parent = scrollP

	for _, target in ipairs(Players:GetPlayers()) do
		if target ~= player then
			local row = Instance.new("TextButton")
			row.Size = UDim2.new(1, -6, 0, 35)
			row.BackgroundColor3 = GREEN_BTN
			row.Text = "   " .. target.Name
			row.TextColor3 = WHITE
			row.TextSize = 12
			row.Font = FONTE_BOLD
			row.TextXAlignment = Enum.TextXAlignment.Left
			row.AutoButtonColor = false
			row.Parent = scrollP

			local rc = Instance.new("UICorner"); rc.CornerRadius = UDim.new(0, 8); rc.Parent = row
			local rs = Instance.new("UIStroke"); rs.Color = GREEN; rs.Thickness = 1; rs.Transparency = 0.5; rs.Parent = row

			row.MouseButton1Click:Connect(function()
				for _, r in ipairs(playerRows) do
					TweenService:Create(r.row, TweenInfo.new(0.2), {BackgroundColor3 = GREEN_BTN}):Play()
					TweenService:Create(r.stroke, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
				end
				TweenService:Create(row, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 140, 70)}):Play()
				TweenService:Create(rs, TweenInfo.new(0.2), {Transparency = 0}):Play()
				selectedPlayer = target

				local btn = contentArea:FindFirstChild("TeleportBtn")
				if btn then 
					local lbl = btn:FindFirstChild("TextLabel")
					if lbl then lbl.Text = "TELEPORTAR PARA " .. target.Name end 
				end
			end)

			table.insert(playerRows, {row = row, stroke = rs, target = target})
		end
	end

	local teleportBtn, teleportLbl = makeBtn3D(contentArea, "TELEPORTAR", "Ir até o player selecionado")
	teleportBtn.Name = "TeleportBtn"
	teleportBtn.Position = UDim2.new(0, 0, 1, -50)
	teleportBtn.Size = UDim2.new(1, 0, 0, 45)
	teleportBtn.ZIndex = 5

	registrarBotao("TELEPORTAR", "Ir até o player selecionado", teleportBtn)

	teleportBtn.MouseButton1Click:Connect(function()
		if not selectedPlayer then
			teleportLbl.Text = "ESCOLHA UM PLAYER"
			task.wait(1.5)
			teleportLbl.Text = "TELEPORTAR"
			return
		end
		local myChar = player.Character
		local tChar = selectedPlayer.Character
		if myChar and tChar then
			local myRoot = myChar:FindFirstChild("HumanoidRootPart")
			local tRoot = tChar:FindFirstChild("HumanoidRootPart")
			if myRoot and tRoot then
				myRoot.CFrame = tRoot.CFrame + Vector3.new(0, 3, 0)
				teleportLbl.Text = "TELEPORTADO!"
				task.wait(1.5)
				teleportLbl.Text = "TELEPORTAR PARA " .. selectedPlayer.Name
			end
		end
	end)
end

-- ABA: JOGADOR
local function buildPlayer()

	clearContent()
	limparRegistros()
	task.wait(0.15)

	local scrollJ = Instance.new("ScrollingFrame")
	scrollJ.Size = UDim2.new(1, 0, 1, 0)
	scrollJ.BackgroundTransparency = 1
	scrollJ.BorderSizePixel = 0
	scrollJ.ScrollBarThickness = 4
	scrollJ.ScrollBarImageColor3 = GREEN
	scrollJ.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollJ.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollJ.Parent = contentArea

	local listJ = Instance.new("UIListLayout")
	listJ.Padding = UDim.new(0, 5)
	listJ.SortOrder = Enum.SortOrder.LayoutOrder
	listJ.Parent = scrollJ

	local lowGravBtn, lowGravLbl = makeBtn3D(scrollJ, "GRAVIDADE BAIXA", "Deixa o personagem mais leve")
	local noFallBtn, noFallLbl   = makeBtn3D(scrollJ, "SEM DANO DE QUEDA", "Impede de morrer ao cair")

	registrarBotao("GRAVIDADE BAIXA", "Deixa o personagem mais leve", lowGravBtn)
	registrarBotao("SEM DANO DE QUEDA", "Impede de morrer ao cair", noFallBtn)

	local lowGravOn = false
	local lowGravConn

	lowGravBtn.MouseButton1Click:Connect(function()
		lowGravOn = not lowGravOn

		if lowGravOn then
			lowGravLbl.Text = "GRAVIDADE BAIXA: ON"
			lowGravConn = RunService.Heartbeat:Connect(function()
				if not lowGravOn then return end
				local char = player.Character
				if not char then return end
				for _, part in ipairs(char:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5, 1, 1)
					end
				end
				workspace.Gravity = 60
			end)
		else
			lowGravLbl.Text = "GRAVIDADE BAIXA"
			if lowGravConn then lowGravConn:Disconnect() end
			workspace.Gravity = 196.2
		end
	end)

	local noFallOn = false

	noFallBtn.MouseButton1Click:Connect(function()
		noFallOn = not noFallOn

		local char = player.Character
		if char then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then
				hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, not noFallOn)
			end
		end

		if noFallOn then
			noFallLbl.Text = "SEM DANO DE QUEDA: ON"
		else
			noFallLbl.Text = "SEM DANO DE QUEDA"
		end
	end)
end
--==================================================
-- ABA: FUNÇÕES
--==================================================

local function buildFunctions()

	clearContent()
	limparRegistros()
	task.wait(0.15)

	local scrollF = Instance.new("ScrollingFrame")
	scrollF.Size = UDim2.new(1, 0, 1, 0)
	scrollF.BackgroundTransparency = 1
	scrollF.BorderSizePixel = 0
	scrollF.ScrollBarThickness = 4
	scrollF.ScrollBarImageColor3 = GREEN
	scrollF.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollF.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollF.Parent = contentArea

	local listF = Instance.new("UIListLayout")
	listF.Padding = UDim.new(0, 5)
	listF.SortOrder = Enum.SortOrder.LayoutOrder
	listF.Parent = scrollF

	local fpsBtn, fpsLbl         = makeBtn3D(scrollF, "FPS / RELÓGIO", "Mostra FPS e horário")
	local speedBtn, speedLbl     = makeBtn3D(scrollF, "SPEED", "Aumenta a velocidade")
	local viewBtn, viewLbl       = makeBtn3D(scrollF, "VER PLAYER", "Olha pelos olhos do player")
	local calcBtn, calcLbl       = makeBtn3D(scrollF, "CALCULADORA", "Calcula contas")
	local jumpBtn, jumpLbl       = makeBtn3D(scrollF, "PULO INFINITO", "Pula sem parar no ar")
	local flyBtn, flyLbl         = makeBtn3D(scrollF, "FLY MOBILE", "Voar com botões")
	local musicBtn, musicLbl     = makeBtn3D(scrollF, "TOCAR MÚSICA", "Toca música perto de você")
	local followBtn, followLbl   = makeBtn3D(scrollF, "SEGUIR PLAYER", "Segue o player escolhido")
	local rgbBtn, rgbLbl         = makeBtn3D(scrollF, "RGB", "Cor do boneco muda")
	local noclipBtn, noclipLbl   = makeBtn3D(scrollF, "NOCLIP (PAREDES)", "Atravessa paredes")

	registrarBotao("FPS / RELÓGIO", "Mostra FPS e horário", fpsBtn)
	registrarBotao("SPEED", "Aumenta a velocidade", speedBtn)
	registrarBotao("VER PLAYER", "Olha pelos olhos do player", viewBtn)
	registrarBotao("CALCULADORA", "Calcula contas", calcBtn)
	registrarBotao("PULO INFINITO", "Pula sem parar no ar", jumpBtn)
	registrarBotao("FLY MOBILE", "Voar com botões", flyBtn)
	registrarBotao("TOCAR MÚSICA", "Toca música perto de você", musicBtn)
	registrarBotao("SEGUIR PLAYER", "Segue o player escolhido", followBtn)
	registrarBotao("RGB", "Cor do boneco muda", rgbBtn)
	registrarBotao("NOCLIP (PAREDES)", "Atravessa paredes", noclipBtn)

	-- FPS
	local hudGui = Instance.new("ScreenGui")
	hudGui.Name = "DYV_HUD"
	hudGui.ResetOnSpawn = false
	hudGui.IgnoreGuiInset = true
	hudGui.Parent = playerGui

	local hud = Instance.new("TextLabel")
	hud.Size = UDim2.fromOffset(220, 40)
	hud.Position = UDim2.new(0, 15, 1, -60)
	hud.BackgroundColor3 = BLACK
	hud.BackgroundTransparency = 0.4
	hud.TextColor3 = GREEN
	hud.TextSize = 14
	hud.Font = FONTE_BOLD
	hud.Text = "FPS: -- | --:--:--"
	hud.Visible = false
	hud.Parent = hudGui

	local hudCorner = Instance.new("UICorner")
	hudCorner.CornerRadius = UDim.new(0, 10)
	hudCorner.Parent = hud

	local hudStroke = Instance.new("UIStroke")
	hudStroke.Color = GREEN
	hudStroke.Thickness = 1
	hudStroke.Transparency = 0.3
	hudStroke.Parent = hud

	local hudOn = false

	task.spawn(function()
		while true do
			if hudOn then
				local fps = math.floor(1 / RunService.RenderStepped:Wait())
				local t = os.date("*t")
				hud.Text = string.format("FPS: %d | %02d:%02d:%02d", fps, t.hour, t.min, t.sec)
			else
				task.wait(0.3)
			end
		end
	end)

	fpsBtn.MouseButton1Click:Connect(function()
		hudOn = not hudOn
		hud.Visible = hudOn
		fpsLbl.Text = hudOn and "FPS / RELÓGIO: ON" or "FPS / RELÓGIO"
	end)

	-- SPEED
	speedBtn.MouseButton1Click:Connect(function()
		inputBox("DIGITE A VELOCIDADE", "Ex: 100", function(texto)
			local value = tonumber(texto)
			if value then
				local char = player.Character
				if char then
					local hum = char:FindFirstChildOfClass("Humanoid")
					if hum then hum.WalkSpeed = value end
				end
				speedLbl.Text = "SPEED: " .. value
			end
		end)
	end)

	-- VER PLAYER
	local viewing = false
	local viewConn

	viewBtn.MouseButton1Click:Connect(function()
		if viewing then
			viewing = false
			if viewConn then viewConn:Disconnect() end
			workspace.CurrentCamera.CameraSubject = player.Character and player.Character:FindFirstChildOfClass("Humanoid") or nil
			viewLbl.Text = "VER PLAYER"
			return
		end
		inputBox("VER PLAYER", "Nick (4+ letras)", function(texto)
			local target = findPlayer(texto)
			if target and target.Character then
				local hum = target.Character:FindFirstChildOfClass("Humanoid")
				if hum then
					viewing = true
					workspace.CurrentCamera.CameraSubject = hum
					viewLbl.Text = "VER: " .. target.Name
					if viewConn then viewConn:Disconnect() end
					viewConn = RunService.RenderStepped:Connect(function()
						if not viewing then return end
						local c = target.Character
						if c then
							local h = c:FindFirstChildOfClass("Humanoid")
							if h then workspace.CurrentCamera.CameraSubject = h end
						end
					end)
				end
			end
		end)
	end)

	-- CALCULADORA
	calcBtn.MouseButton1Click:Connect(function()
		local panel = Instance.new("Frame")
		panel.Size = UDim2.fromOffset(260, 200)
		panel.Position = UDim2.fromScale(0.5, 0.5)
		panel.AnchorPoint = Vector2.new(0.5, 0.5)
		panel.BackgroundColor3 = DARK
		panel.ZIndex = 90
		panel.Parent = gui

		local pc = Instance.new("UICorner"); pc.CornerRadius = UDim.new(0, 14); pc.Parent = panel
		local ps = Instance.new("UIStroke"); ps.Color = GREEN; ps.Thickness = 2; ps.Transparency = 0.2; ps.Parent = panel

		local inp = Instance.new("TextBox")
		inp.Size = UDim2.new(1, -20, 0, 40)
		inp.Position = UDim2.fromOffset(10, 18)
		inp.BackgroundColor3 = BLACK
		inp.TextColor3 = GREEN
		inp.PlaceholderText = "Ex: 10 * 5"
		inp.PlaceholderColor3 = Color3.fromRGB(130,130,130)
		inp.TextSize = 15
		inp.Font = FONTE
		inp.ZIndex = 91
		inp.Parent = panel
		local ic = Instance.new("UICorner"); ic.CornerRadius = UDim.new(0, 10); ic.Parent = inp

		local res = Instance.new("TextLabel")
		res.Size = UDim2.new(1, -20, 0, 35)
		res.Position = UDim2.fromOffset(10, 65)
		res.BackgroundTransparency = 1
		res.Text = "Resultado: —"
		res.TextColor3 = GREEN
		res.TextSize = 16
		res.Font = FONTE_BOLD
		res.ZIndex = 91
		res.Parent = panel

		local calcBtn2 = Instance.new("TextButton")
		calcBtn2.Size = UDim2.new(1, -20, 0, 35)
		calcBtn2.Position = UDim2.fromOffset(10, 110)
		calcBtn2.BackgroundColor3 = GREEN_BTN
		calcBtn2.Text = "CALCULAR"
		calcBtn2.TextColor3 = WHITE
		calcBtn2.TextSize = 13
		calcBtn2.Font = FONTE_BOLD
		calcBtn2.ZIndex = 91
		calcBtn2.Parent = panel
		local cc = Instance.new("UICorner"); cc.CornerRadius = UDim.new(0, 10); cc.Parent = calcBtn2
		local cs = Instance.new("UIStroke"); cs.Color = GREEN; cs.Thickness = 1; cs.Parent = calcBtn2

		local close = Instance.new("TextButton")
		close.Size = UDim2.fromOffset(28, 28)
		close.Position = UDim2.new(1, -33, 0, 3)
		close.BackgroundTransparency = 1
		close.Text = "X"
		close.TextColor3 = GREEN
		close.TextSize = 13
		close.Font = FONTE_BOLD
		close.ZIndex = 91
		close.Parent = panel
		close.MouseButton1Click:Connect(function() panel:Destroy() end)

		calcBtn2.MouseButton1Click:Connect(function()
			local t = inp.Text:gsub("×", "*"):gsub("÷", "/")
			local a, op, b = t:match("^%s*(-?[%d%.]+)%s*([%+%-%*/])%s*(-?[%d%.]+)%s*$")
			if a and op and b then
				a = tonumber(a); b = tonumber(b)
				local ans
				if op == "+" then ans = a + b
				elseif op == "-" then ans = a - b
				elseif op == "*" then ans = a * b
				elseif op == "/" then if b ~= 0 then ans = a / b end end
				res.Text = "Resultado: " .. (ans or "inválido")
			else
				res.Text = "Resultado: inválido"
			end
		end)
	end)

	-- PULO INFINITO
	local infiniteJump = false
	local jumpConn

	jumpBtn.MouseButton1Click:Connect(function()
		infiniteJump = not infiniteJump

		if infiniteJump then
			jumpLbl.Text = "PULO INFINITO: ON"
			jumpConn = UserInputService.JumpRequest:Connect(function()
				local char = player.Character
				if char then
					local hum = char:FindFirstChildOfClass("Humanoid")
					if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
				end
			end)
		else
			jumpLbl.Text = "PULO INFINITO"
			if jumpConn then jumpConn:Disconnect() end
		end
	end)

	-- FLY MOBILE
	local flying = false
	local flyVelocity
	local flyConn
	local fUp, fDown, fLeft, fRight, fFront, fBack = false, false, false, false, false, false

	local flyControls = Instance.new("Frame")
	flyControls.Size = UDim2.fromOffset(200, 200)
	flyControls.Position = UDim2.new(0, 20, 1, -220)
	flyControls.BackgroundTransparency = 1
	flyControls.Visible = false
	flyControls.ZIndex = 95
	flyControls.Parent = gui

	local function flyBtn2(text, pos)
		local b = Instance.new("TextButton")
		b.Size = UDim2.fromOffset(55, 45)
		b.Position = pos
		b.BackgroundColor3 = BLACK
		b.Text = text
		b.TextColor3 = GREEN
		b.TextSize = 20
		b.Font = FONTE_BOLD
		b.ZIndex = 96
		b.Parent = flyControls
		local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 12); c.Parent = b
		local s = Instance.new("UIStroke"); s.Color = GREEN; s.Thickness = 1; s.Parent = b
		return b
	end

	local upBtn    = flyBtn2("▲", UDim2.fromOffset(72, 0))
	local leftBtn  = flyBtn2("◀", UDim2.fromOffset(0, 50))
	local rightBtn = flyBtn2("▶", UDim2.fromOffset(144, 50))
	local downBtn  = flyBtn2("▼", UDim2.fromOffset(72, 100))
	local frontBtn = flyBtn2("↑", UDim2.fromOffset(72, 150))
	local backBtn  = flyBtn2("↓", UDim2.fromOffset(0, 150))

	upBtn.MouseButton1Down:Connect(function() fUp = true end)
	upBtn.MouseButton1Up:Connect(function() fUp = false end)
	downBtn.MouseButton1Down:Connect(function() fDown = true end)
	downBtn.MouseButton1Up:Connect(function() fDown = false end)
	leftBtn.MouseButton1Down:Connect(function() fLeft = true end)
	leftBtn.MouseButton1Up:Connect(function() fLeft = false end)
	rightBtn.MouseButton1Down:Connect(function() fRight = true end)
	rightBtn.MouseButton1Up:Connect(function() fRight = false end)
	frontBtn.MouseButton1Down:Connect(function() fFront = true end)
	frontBtn.MouseButton1Up:Connect(function() fFront = false end)
	backBtn.MouseButton1Down:Connect(function() fBack = true end)
	backBtn.MouseButton1Up:Connect(function() fBack = false end)

	flyBtn.MouseButton1Click:Connect(function()
		flying = not flying

		local char = player.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		local hum = char:FindFirstChildOfClass("Humanoid")
		if not root or not hum then return end

		if flying then
			flyLbl.Text = "FLY: ON"
			flyControls.Visible = true

			flyVelocity = Instance.new("BodyVelocity")
			flyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			flyVelocity.Velocity = Vector3.zero
			flyVelocity.Parent = root
			hum.PlatformStand = true

			flyConn = RunService.RenderStepped:Connect(function()
				if not flying or not root.Parent then return end
				local cam = workspace.CurrentCamera
				local vel = Vector3.zero
				local speed = 50

				if fFront then vel += cam.CFrame.LookVector * speed end
				if fBack then vel -= cam.CFrame.LookVector * speed end
				if fLeft then vel -= cam.CFrame.RightVector * speed end
				if fRight then vel += cam.CFrame.RightVector * speed end
				if fUp then vel += Vector3.new(0, speed, 0) end
				if fDown then vel -= Vector3.new(0, speed, 0) end

				flyVelocity.Velocity = vel

				local look = cam.CFrame.LookVector
				root.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(look.X, 0, look.Z))
			end)
		else
			flyLbl.Text = "FLY MOBILE"
			flyControls.Visible = false
			if flyConn then flyConn:Disconnect() end
			if flyVelocity then flyVelocity:Destroy() end
			hum.PlatformStand = false
		end
	end)

	-- MÚSICA (perto)
	local musicOn = false
	local musicSound

	musicBtn.MouseButton1Click:Connect(function()
		if musicOn then
			musicOn = false
			if musicSound then musicSound:Destroy() end
			musicLbl.Text = "TOCAR MÚSICA"
			return
		end
		inputBox("ID DA MÚSICA", "Ex: 1837879082", function(texto)
			local id = tonumber(texto)
			if id then
				local char = player.Character
				if char then
					local root = char:FindFirstChild("HumanoidRootPart")
					if root then
						musicSound = Instance.new("Sound")
						musicSound.SoundId = "rbxassetid://" .. id
						musicSound.Volume = 3
						musicSound.RollOffMaxDistance = 50
						musicSound.RollOffMinDistance = 5
						musicSound.RollOffMode = Enum.RollOffMode.InverseTapered
						musicSound.Parent = root
						musicSound:Play()
						musicOn = true
						musicLbl.Text = "MÚSICA: ON"
					end
				end
			end
		end)
	end)

	-- SEGUIR
	local following = false
	local followConn

	followBtn.MouseButton1Click:Connect(function()
		if following then
			following = false
			if followConn then followConn:Disconnect() end
			followLbl.Text = "SEGUIR PLAYER"
			return
		end
		inputBox("SEGUIR PLAYER", "Nick (4+ letras)", function(texto)
			local target = findPlayer(texto)
			if target then
				following = true
				followLbl.Text = "SEG: " .. target.Name
				followConn = RunService.Heartbeat:Connect(function()
					if not following then return end
					local myChar = player.Character
					local tChar = target.Character
					if not myChar or not tChar then return end
					local myRoot = myChar:FindFirstChild("HumanoidRootPart")
					local tRoot = tChar:FindFirstChild("HumanoidRootPart")
					if myRoot and tRoot then
						myRoot.CFrame = myRoot.CFrame:Lerp(tRoot.CFrame * CFrame.new(0, 0, 4), 0.15)
					end
				end)
			end
		end)
	end)

	-- RGB
	local rgbOn = false
	local rgbConn
	local hue = 0

	rgbBtn.MouseButton1Click:Connect(function()
		rgbOn = not rgbOn

		if rgbOn then
			rgbLbl.Text = "RGB: ON"
			rgbConn = RunService.RenderStepped:Connect(function()
				if not rgbOn then return end
				hue = (hue + 0.01) % 1
				local char = player.Character
				if not char then return end
				local color = Color3.fromHSV(hue, 1, 1)
				for _, part in ipairs(char:GetDescendants()) do
					if part:IsA("BasePart") then part.Color = color end
				end
			end)
		else
			rgbLbl.Text = "RGB"
			if rgbConn then rgbConn:Disconnect() end
		end
	end)

	-- NOCLIP
	local noclipOn = false
	local noclipConn

	noclipBtn.MouseButton1Click:Connect(function()
		noclipOn = not noclipOn
		local char = player.Character
		if not char then return end

		if noclipOn then
			noclipLbl.Text = "NOCLIP: ON"
			noclipConn = RunService.Stepped:Connect(function()
				if not noclipOn then return end
				local c = player.Character
				if not c then return end
				for _, part in ipairs(c:GetDescendants()) do
					if part:IsA("BasePart") then part.CanCollide = false end
				end
			end)
		else
			noclipLbl.Text = "NOCLIP (PAREDES)"
			if noclipConn then noclipConn:Disconnect() end
			local c = player.Character
			if c then
				for _, part in ipairs(c:GetDescendants()) do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then part.CanCollide = true end
				end
			end
		end
	end)
end

--==================================================
-- ABA: MIRA E APELAÇÕES
--==================================================

local function buildMira()

	clearContent()
	limparRegistros()
	task.wait(0.15)

	local scrollMi = Instance.new("ScrollingFrame")
	scrollMi.Size = UDim2.new(1, 0, 1, 0)
	scrollMi.BackgroundTransparency = 1
	scrollMi.BorderSizePixel = 0
	scrollMi.ScrollBarThickness = 4
	scrollMi.ScrollBarImageColor3 = GREEN
	scrollMi.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollMi.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollMi.Parent = contentArea

	local listMi = Instance.new("UIListLayout")
	listMi.Padding = UDim.new(0, 5)
	listMi.SortOrder = Enum.SortOrder.LayoutOrder
	listMi.Parent = scrollMi

	local miraConfig = {
		aimbot = false,
		silentAim = false,
		triggerBot = false,
		chams = false,
		nomes = false,
		distancia = false,
		vida = false,
		timeCheck = false,
		corChams = Color3.fromRGB(255, 0, 0),
	}

	local aimbotBtn, aimbotLbl   = makeBtn3D(scrollMi, "AIMBOT", "Trava a mira no player mais próximo")
	local silentBtn, silentLbl   = makeBtn3D(scrollMi, "SILENT AIM", "Acerta sem mover a câmera")
	local triggerBtn, triggerLbl = makeBtn3D(scrollMi, "TRIGGER BOT", "Atira sozinho quando mira no player")
	local chamsBtn, chamsLbl     = makeBtn3D(scrollMi, "CHAMS", "Pinta os players de vermelho (vê pela parede)")
	local nomeBtn, nomeLbl       = makeBtn3D(scrollMi, "NOME DOS PLAYERS", "Mostra o nome em cima da cabeça")
	local distBtn, distLbl       = makeBtn3D(scrollMi, "DISTÂNCIA", "Mostra quantos studs tá de cada player")
	local vidaBtn, vidaLbl       = makeBtn3D(scrollMi, "VIDA DOS PLAYERS", "Mostra a barra de vida dos players")
	local timeBtn, timeLbl       = makeBtn3D(scrollMi, "NÃO MIRAR NO TIME", "Ignora os players do seu time")

	registrarBotao("AIMBOT", "Trava a mira no player mais próximo", aimbotBtn)
	registrarBotao("SILENT AIM", "Acerta sem mover a câmera", silentBtn)
	registrarBotao("TRIGGER BOT", "Atira sozinho quando mira no player", triggerBtn)
	registrarBotao("CHAMS", "Pinta os players de vermelho (vê pela parede)", chamsBtn)
	registrarBotao("NOME DOS PLAYERS", "Mostra o nome em cima da cabeça", nomeBtn)
	registrarBotao("DISTÂNCIA", "Mostra quantos studs tá de cada player", distBtn)
	registrarBotao("VIDA DOS PLAYERS", "Mostra a barra de vida dos players", vidaBtn)
	registrarBotao("NÃO MIRAR NO TIME", "Ignora os players do seu time", timeBtn)

	local function isTeam(target)
		if not miraConfig.timeCheck then return false end
		if not player.Team or not target.Team then return false end
		return player.Team == target.Team
	end

	local function getClosestPlayer()
		local closest = nil
		local shortestDist = math.huge
		local myChar = player.Character
		if not myChar then return nil end
		local myRoot = myChar:FindFirstChild("HumanoidRootPart")
		if not myRoot then return nil end

		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= player and p.Character then
				local root = p.Character:FindFirstChild("HumanoidRootPart")
				local hum = p.Character:FindFirstChildOfClass("Humanoid")
				if root and hum and hum.Health > 0 and not isTeam(p) then
					local dist = (root.Position - myRoot.Position).Magnitude
					if dist < shortestDist then
						shortestDist = dist
						closest = p
					end
				end
			end
		end
		return closest
	end

	-- AIMBOT
	local aimbotConn

	aimbotBtn.MouseButton1Click:Connect(function()
		miraConfig.aimbot = not miraConfig.aimbot

		if miraConfig.aimbot then
			aimbotLbl.Text = "AIMBOT: ON"
			aimbotConn = RunService.RenderStepped:Connect(function()
				if not miraConfig.aimbot then return end
				local target = getClosestPlayer()
				if not target or not target.Character then return end
				local head = target.Character:FindFirstChild("Head")
				if not head then return end
				local cam = workspace.CurrentCamera
				cam.CFrame = CFrame.new(cam.CFrame.Position, head.Position)
			end)
		else
			aimbotLbl.Text = "AIMBOT"
			if aimbotConn then aimbotConn:Disconnect() end
		end
	end)

	-- SILENT AIM
	local silentConn

	silentBtn.MouseButton1Click:Connect(function()
		miraConfig.silentAim = not miraConfig.silentAim

		if miraConfig.silentAim then
			silentLbl.Text = "SILENT AIM: ON"
			silentConn = RunService.RenderStepped:Connect(function()
				if not miraConfig.silentAim then return end
				local target = getClosestPlayer()
				if not target or not target.Character then return end
				local head = target.Character:FindFirstChild("Head")
				if not head then return end
				local cam = workspace.CurrentCamera
				cam.CFrame = CFrame.new(cam.CFrame.Position, head.Position)
			end)
		else
			silentLbl.Text = "SILENT AIM"
			if silentConn then silentConn:Disconnect() end
		end
	end)

	-- TRIGGER BOT
	local triggerConn

	triggerBtn.MouseButton1Click:Connect(function()
		miraConfig.triggerBot = not miraConfig.triggerBot

		if miraConfig.triggerBot then
			triggerLbl.Text = "TRIGGER BOT: ON"
			triggerConn = RunService.RenderStepped:Connect(function()
				if not miraConfig.triggerBot then return end
				local target = getClosestPlayer()
				if not target then return end
				local char = player.Character
				if not char then return end
				local tool = char:FindFirstChildOfClass("Tool")
				if tool then
					pcall(function() tool:Activate() end)
				end
			end)
		else
			triggerLbl.Text = "TRIGGER BOT"
			if triggerConn then triggerConn:Disconnect() end
		end
	end)

	-- CHAMS
	local chamsConn

	chamsBtn.MouseButton1Click:Connect(function()
		miraConfig.chams = not miraConfig.chams

		if miraConfig.chams then
			chamsLbl.Text = "CHAMS: ON"
			chamsConn = RunService.RenderStepped:Connect(function()
				if not miraConfig.chams then return end
				for _, p in ipairs(Players:GetPlayers()) do
					if p ~= player and p.Character then
						for _, part in ipairs(p.Character:GetDescendants()) do
							if part:IsA("BasePart") then
								part.Material = Enum.Material.Neon
								part.Color = miraConfig.corChams
							end
						end
					end
				end
			end)
		else
			chamsLbl.Text = "CHAMS"
			if chamsConn then chamsConn:Disconnect() end
			for _, p in ipairs(Players:GetPlayers()) do
				if p ~= player and p.Character then
					for _, part in ipairs(p.Character:GetDescendants()) do
						if part:IsA("BasePart") then
							part.Material = Enum.Material.Plastic
						end
					end
				end
			end
		end
	end)

	-- NOME DOS PLAYERS
	local nomeGui = Instance.new("ScreenGui")
	nomeGui.Name = "DYV_NOMES"
	nomeGui.ResetOnSpawn = false
	nomeGui.IgnoreGuiInset = true
	nomeGui.Parent = playerGui

	local nomeTags = {}

	nomeBtn.MouseButton1Click:Connect(function()
		miraConfig.nomes = not miraConfig.nomes

		if miraConfig.nomes then
			nomeLbl.Text = "NOME: ON"

			local function criarTag(p)
				if p == player then return end
				if nomeTags[p] then return end

				local tag = Instance.new("TextLabel")
				tag.Size = UDim2.fromOffset(120, 20)
				tag.BackgroundTransparency = 1
				tag.Text = p.Name
				tag.TextColor3 = RED
				tag.TextSize = 12
				tag.Font = FONTE_BOLD
				tag.Parent = nomeGui

				local conn
				conn = RunService.RenderStepped:Connect(function()
					if not miraConfig.nomes then
						tag:Destroy()
						if conn then conn:Disconnect() end
						return
					end
					if not p.Character then tag.Visible = false return end
					local head = p.Character:FindFirstChild("Head")
					if not head then tag.Visible = false return end
					local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(head.Position + Vector3.new(0, 2, 0))
					if onScreen then
						tag.Visible = true
						tag.Position = UDim2.fromOffset(screenPos.X - 60, screenPos.Y)
					else
						tag.Visible = false
					end
				end)

				nomeTags[p] = tag
			end

			for _, p in ipairs(Players:GetPlayers()) do criarTag(p) end
			Players.PlayerAdded:Connect(criarTag)

		else
			nomeLbl.Text = "NOME DOS PLAYERS"
			for _, tag in pairs(nomeTags) do
				tag:Destroy()
			end
			nomeTags = {}
		end
	end)

	-- DISTÂNCIA
	local distGui = Instance.new("ScreenGui")
	distGui.Name = "DYV_DIST"
	distGui.ResetOnSpawn = false
	distGui.IgnoreGuiInset = true
	distGui.Parent = playerGui

	local distTags = {}

	distBtn.MouseButton1Click:Connect(function()
		miraConfig.distancia = not miraConfig.distancia

		if miraConfig.distancia then
			distLbl.Text = "DISTÂNCIA: ON"

			local function criarDist(p)
				if p == player then return end
				if distTags[p] then return end

				local tag = Instance.new("TextLabel")
				tag.Size = UDim2.fromOffset(80, 18)
				tag.BackgroundTransparency = 1
				tag.Text = "0 studs"
				tag.TextColor3 = GREEN
				tag.TextSize = 11
				tag.Font = FONTE_BOLD
				tag.Parent = distGui

				local conn
				conn = RunService.RenderStepped:Connect(function()
					if not miraConfig.distancia then
						tag:Destroy()
						if conn then conn:Disconnect() end
						return
					end
					local myChar = player.Character
					if not myChar or not p.Character then tag.Visible = false return end
					local myRoot = myChar:FindFirstChild("HumanoidRootPart")
					local head = p.Character:FindFirstChild("Head")
					if not myRoot or not head then tag.Visible = false return end

					local dist = math.floor((head.Position - myRoot.Position).Magnitude)
					tag.Text = dist .. " studs"

					local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(head.Position + Vector3.new(0, 3, 0))
					if onScreen then
						tag.Visible = true
						tag.Position = UDim2.fromOffset(screenPos.X - 40, screenPos.Y)
					else
						tag.Visible = false
					end
				end)

				distTags[p] = tag
			end

			for _, p in ipairs(Players:GetPlayers()) do criarDist(p) end
			Players.PlayerAdded:Connect(criarDist)

		else
			distLbl.Text = "DISTÂNCIA"
			for _, tag in pairs(distTags) do
				tag:Destroy()
			end
			distTags = {}
		end
	end)

	-- VIDA DOS PLAYERS
	local vidaGui = Instance.new("ScreenGui")
	vidaGui.Name = "DYV_VIDA"
	vidaGui.ResetOnSpawn = false
	vidaGui.IgnoreGuiInset = true
	vidaGui.Parent = playerGui

	local vidaTags = {}

	vidaBtn.MouseButton1Click:Connect(function()
		miraConfig.vida = not miraConfig.vida

		if miraConfig.vida then
			vidaLbl.Text = "VIDA: ON"

			local function criarVida(p)
				if p == player then return end
				if vidaTags[p] then return end

				local bg = Instance.new("Frame")
				bg.Size = UDim2.fromOffset(60, 6)
				bg.BackgroundColor3 = BLACK
				bg.BorderSizePixel = 0
				bg.Parent = vidaGui

				local bgCorner = Instance.new("UICorner")
				bgCorner.CornerRadius = UDim.new(1, 0)
				bgCorner.Parent = bg

				local fill = Instance.new("Frame")
				fill.Size = UDim2.new(1, 0, 1, 0)
				fill.BackgroundColor3 = GREEN
				fill.BorderSizePixel = 0
				fill.Parent = bg

				local fillCorner = Instance.new("UICorner")
				fillCorner.CornerRadius = UDim.new(1, 0)
				fillCorner.Parent = fill

				local conn
				conn = RunService.RenderStepped:Connect(function()
					if not miraConfig.vida then
						bg:Destroy()
						if conn then conn:Disconnect() end
						return
					end
					if not p.Character then bg.Visible = false return end
					local hum = p.Character:FindFirstChildOfClass("Humanoid")
					local head = p.Character:FindFirstChild("Head")
					if not hum or not head then bg.Visible = false return end

					local porcentagem = hum.Health / hum.MaxHealth
					fill.Size = UDim2.new(math.clamp(porcentagem, 0, 1), 0, 1, 0)
					fill.BackgroundColor3 = Color3.fromRGB(255 * (1 - porcentagem), 255 * porcentagem, 0)

					local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(head.Position + Vector3.new(0, 3.5, 0))
					if onScreen then
						bg.Visible = true
						bg.Position = UDim2.fromOffset(screenPos.X - 30, screenPos.Y)
					else
						bg.Visible = false
					end
				end)

				vidaTags[p] = bg
			end

			for _, p in ipairs(Players:GetPlayers()) do criarVida(p) end
			Players.PlayerAdded:Connect(criarVida)

		else
			vidaLbl.Text = "VIDA DOS PLAYERS"
			for _, tag in pairs(vidaTags) do
				tag:Destroy()
			end
			vidaTags = {}
		end
	end)

	-- NÃO MIRAR NO TIME
	timeBtn.MouseButton1Click:Connect(function()
		miraConfig.timeCheck = not miraConfig.timeCheck
		timeLbl.Text = miraConfig.timeCheck and "NÃO MIRAR TIME: ON" or "NÃO MIRAR NO TIME"
	end)
end
--==================================================
-- ABA: MÚSICA
--==================================================

local function buildMusic()

	clearContent()
	limparRegistros()
	task.wait(0.15)

	local scrollM = Instance.new("ScrollingFrame")
	scrollM.Size = UDim2.new(1, 0, 1, 0)
	scrollM.BackgroundTransparency = 1
	scrollM.BorderSizePixel = 0
	scrollM.ScrollBarThickness = 4
	scrollM.ScrollBarImageColor3 = GREEN
	scrollM.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollM.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollM.Parent = contentArea

	local listM = Instance.new("UIListLayout")
	listM.Padding = UDim.new(0, 8)
	listM.SortOrder = Enum.SortOrder.LayoutOrder
	listM.Parent = scrollM

	local tituloMus = Instance.new("TextLabel")
	tituloMus.Size = UDim2.new(1, 0, 0, 20)
	tituloMus.BackgroundTransparency = 1
	tituloMus.Text = "🎵  TOCAR MÚSICA (SÓ VOCÊ ESCUTA)"
	tituloMus.TextColor3 = GREEN
	tituloMus.TextSize = 11
	tituloMus.Font = FONTE_BOLD
	tituloMus.TextXAlignment = Enum.TextXAlignment.Left
	tituloMus.Parent = scrollM

	local idInput = Instance.new("TextBox")
	idInput.Size = UDim2.new(1, -6, 0, 38)
	idInput.BackgroundColor3 = BLACK
	idInput.Text = ""
	idInput.PlaceholderText = "ID da música (ex: 1837879082)"
	idInput.PlaceholderColor3 = Color3.fromRGB(130, 130, 130)
	idInput.TextColor3 = GREEN
	idInput.TextSize = 13
	idInput.Font = FONTE
	idInput.ClearTextOnFocus = false
	idInput.Parent = scrollM

	local idCorner = Instance.new("UICorner")
	idCorner.CornerRadius = UDim.new(0, 10)
	idCorner.Parent = idInput

	local idStroke = Instance.new("UIStroke")
	idStroke.Color = GREEN
	idStroke.Thickness = 1
	idStroke.Transparency = 0.3
	idStroke.Parent = idInput

	local volFrame = Instance.new("Frame")
	volFrame.Size = UDim2.new(1, -6, 0, 50)
	volFrame.BackgroundColor3 = GREEN_BTN
	volFrame.Parent = scrollM

	local volCorner = Instance.new("UICorner")
	volCorner.CornerRadius = UDim.new(0, 10)
	volCorner.Parent = volFrame

	local volStroke = Instance.new("UIStroke")
	volStroke.Color = GREEN
	volStroke.Thickness = 1
	volStroke.Transparency = 0.3
	volStroke.Parent = volFrame

	local volLabel = Instance.new("TextLabel")
	volLabel.Size = UDim2.new(1, -20, 0, 18)
	volLabel.Position = UDim2.fromOffset(10, 3)
	volLabel.BackgroundTransparency = 1
	volLabel.Text = "Volume: 50%"
	volLabel.TextColor3 = WHITE
	volLabel.TextSize = 12
	volLabel.Font = FONTE_BOLD
	volLabel.TextXAlignment = Enum.TextXAlignment.Left
	volLabel.Parent = volFrame

	local sliderBg = Instance.new("Frame")
	sliderBg.Size = UDim2.new(1, -20, 0, 10)
	sliderBg.Position = UDim2.fromOffset(10, 30)
	sliderBg.BackgroundColor3 = BLACK
	sliderBg.BorderSizePixel = 0
	sliderBg.Parent = volFrame

	local sliderBgCorner = Instance.new("UICorner")
	sliderBgCorner.CornerRadius = UDim.new(0, 5)
	sliderBgCorner.Parent = sliderBg

	local sliderFill = Instance.new("Frame")
	sliderFill.Size = UDim2.new(0.5, 0, 1, 0)
	sliderFill.BackgroundColor3 = GREEN
	sliderFill.BorderSizePixel = 0
	sliderFill.Parent = sliderBg

	local sliderFillCorner = Instance.new("UICorner")
	sliderFillCorner.CornerRadius = UDim.new(0, 5)
	sliderFillCorner.Parent = sliderFill

	local sliderKnob = Instance.new("Frame")
	sliderKnob.Size = UDim2.fromOffset(16, 16)
	sliderKnob.Position = UDim2.new(0.5, -8, 0.5, -8)
	sliderKnob.BackgroundColor3 = WHITE
	sliderKnob.BorderSizePixel = 0
	sliderKnob.ZIndex = 5
	sliderKnob.Parent = sliderBg

	local sliderKnobCorner = Instance.new("UICorner")
	sliderKnobCorner.CornerRadius = UDim.new(1, 0)
	sliderKnobCorner.Parent = sliderKnob

	local volumeAtual = 0.5
	local musicSound = nil

	local draggingSlider = false

	sliderBg.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			draggingSlider = true

			local function atualiza(inp)
				local mouseX = inp.Position.X - sliderBg.AbsolutePosition.X
				local porcentagem = math.clamp(mouseX / sliderBg.AbsoluteSize.X, 0, 1)
				sliderFill.Size = UDim2.new(porcentagem, 0, 1, 0)
				sliderKnob.Position = UDim2.new(porcentagem, -8, 0.5, -8)
				volumeAtual = porcentagem
				volLabel.Text = "Volume: " .. math.floor(porcentagem * 100) .. "%"
				if musicSound then
					musicSound.Volume = porcentagem * 10
				end
			end

			atualiza(input)

			local conn
			conn = UserInputService.InputChanged:Connect(function(inp)
				if draggingSlider and (inp.UserInputType == Enum.UserInputType.MouseMovement
					or inp.UserInputType == Enum.UserInputType.Touch) then
					atualiza(inp)
				end
			end)

			UserInputService.InputEnded:Connect(function(inp)
				if inp.UserInputType == Enum.UserInputType.MouseButton1
					or inp.UserInputType == Enum.UserInputType.Touch then
					draggingSlider = false
					if conn then conn:Disconnect() end
				end
			end)
		end
	end)

	local playBtn, playLbl = makeBtn3D(scrollM, "TOCAR MÚSICA", "Clique pra tocar a música do ID")
	local stopBtn, stopLbl = makeBtn3D(scrollM, "PARAR MÚSICA", "Para a música que tá tocando")

	registrarBotao("TOCAR MÚSICA", "Clique pra tocar a música do ID", playBtn)
	registrarBotao("PARAR MÚSICA", "Para a música que tá tocando", stopBtn)

	playBtn.MouseButton1Click:Connect(function()
		local id = tonumber(idInput.Text)
		if not id then
			playLbl.Text = "ID INVÁLIDO!"
			task.wait(1.5)
			playLbl.Text = "TOCAR MÚSICA"
			return
		end

		if musicSound then musicSound:Destroy() end

		musicSound = Instance.new("Sound")
		musicSound.SoundId = "rbxassetid://" .. id
		musicSound.Volume = volumeAtual * 10
		musicSound.Looped = true
		musicSound.Parent = gui
		musicSound:Play()

		playLbl.Text = "TOCANDO..."
	end)

	stopBtn.MouseButton1Click:Connect(function()
		if musicSound then
			musicSound:Stop()
			musicSound:Destroy()
			musicSound = nil
		end
		playLbl.Text = "TOCAR MÚSICA"
	end)
end

--==================================================
-- ABA: PREFERÊNCIAS
--==================================================

local function buildPreferences()

	clearContent()
	limparRegistros()
	task.wait(0.15)

	local scrollPre = Instance.new("ScrollingFrame")
	scrollPre.Size = UDim2.new(1, 0, 1, 0)
	scrollPre.BackgroundTransparency = 1
	scrollPre.BorderSizePixel = 0
	scrollPre.ScrollBarThickness = 4
	scrollPre.ScrollBarImageColor3 = GREEN
	scrollPre.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollPre.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollPre.Parent = contentArea

	local listPre = Instance.new("UIListLayout")
	listPre.Padding = UDim.new(0, 6)
	listPre.SortOrder = Enum.SortOrder.LayoutOrder
	listPre.Parent = scrollPre

	local fps40Btn, fps40Lbl = makeBtn3D(scrollPre, "FPS + 40", "Melhora o desempenho")
	local originalFov = workspace.CurrentCamera.FieldOfView
	local fps40On = false

	registrarBotao("FPS + 40", "Melhora o desempenho", fps40Btn)

	fps40Btn.MouseButton1Click:Connect(function()
		fps40On = not fps40On
		if fps40On then
			fps40Lbl.Text = "FPS +40: ON"
			workspace.CurrentCamera.FieldOfView = 90
			Lighting.GlobalShadows = false
			Lighting.FogEnd = 100000
			for _, v in pairs(Lighting:GetChildren()) do
				if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("BloomEffect") then
					v.Enabled = false
				end
			end
		else
			fps40Lbl.Text = "FPS + 40"
			workspace.CurrentCamera.FieldOfView = originalFov
			Lighting.GlobalShadows = true
			for _, v in pairs(Lighting:GetChildren()) do
				if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("BloomEffect") then
					v.Enabled = true
				end
			end
		end
	end)

	local tituloCeu = Instance.new("TextLabel")
	tituloCeu.Size = UDim2.new(1, 0, 0, 20)
	tituloCeu.BackgroundTransparency = 1
	tituloCeu.Text = "🌈  COR DO CÉU"
	tituloCeu.TextColor3 = GREEN
	tituloCeu.TextSize = 12
	tituloCeu.Font = FONTE_BOLD
	tituloCeu.TextXAlignment = Enum.TextXAlignment.Left
	tituloCeu.Parent = scrollPre

	local coresFrame = Instance.new("Frame")
	coresFrame.Size = UDim2.new(1, 0, 0, 90)
	coresFrame.BackgroundTransparency = 1
	coresFrame.Parent = scrollPre

	local coresGrid = Instance.new("UIGridLayout")
	coresGrid.CellSize = UDim2.new(0, 55, 0, 38)
	coresGrid.CellPadding = UDim.new(0, 8, 0, 8)
	coresGrid.SortOrder = Enum.SortOrder.LayoutOrder
	coresGrid.Parent = coresFrame

	local cores = {
		{name = "Azul",    color = Color3.fromRGB(70, 130, 255)},
		{name = "Amarelo", color = Color3.fromRGB(255, 220, 50)},
		{name = "Verde",   color = Color3.fromRGB(50, 200, 80)},
		{name = "Rosa",    color = Color3.fromRGB(255, 120, 200)},
		{name = "Roxo",    color = Color3.fromRGB(150, 80, 220)},
		{name = "Vermelho",color = Color3.fromRGB(220, 60, 60)},
	}

	for _, c in ipairs(cores) do
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.fromOffset(55, 38)
		btn.BackgroundColor3 = c.color
		btn.Text = ""
		btn.AutoButtonColor = false
		btn.Parent = coresFrame

		local bc = Instance.new("UICorner")
		bc.CornerRadius = UDim.new(0, 8)
		bc.Parent = btn

		local bs = Instance.new("UIStroke")
		bs.Color = GREEN
		bs.Thickness = 1.5
		bs.Transparency = 0.3
		bs.Parent = btn

		btn.MouseButton1Click:Connect(function()
			Lighting.Ambient = c.color
			Lighting.OutdoorAmbient = c.color
			Lighting.ColorShift_Top = c.color
		end)
	end

	local fovBtn, fovLbl = makeBtn3D(scrollPre, "TELA ESTICADA (FOV)", "Aumenta a visão")
	local fovOn = false

	registrarBotao("TELA ESTICADA (FOV)", "Aumenta a visão", fovBtn)

	fovBtn.MouseButton1Click:Connect(function()
		fovOn = not fovOn
		if fovOn then
			workspace.CurrentCamera.FieldOfView = 110
			fovLbl.Text = "TELA ESTICADA: ON"
		else
			workspace.CurrentCamera.FieldOfView = originalFov
			fovLbl.Text = "TELA ESTICADA (FOV)"
		end
	end)

	local sunsetBtn, sunsetLbl = makeBtn3D(scrollPre, "CÉU ENTARDECER", "Ativa o pôr do sol")
	local sunsetOn = false

	registrarBotao("CÉU ENTARDECER", "Ativa o pôr do sol", sunsetBtn)

	sunsetBtn.MouseButton1Click:Connect(function()
		sunsetOn = not sunsetOn

		if sunsetOn then
			sunsetLbl.Text = "ENTARDECER: ON"
			pcall(function()
				for _, v in ipairs(Lighting:GetChildren()) do
					if v:IsA("Sky") then v:Destroy() end
				end

				local sky = Instance.new("Sky")
				sky.Name = "HZ_SunsetSky"
				sky.SkyboxBk = "rbxassetid://600832720"
				sky.SkyboxDn = "rbxassetid://600832804"
				sky.SkyboxFt = "rbxassetid://600833083"
				sky.SkyboxLf = "rbxassetid://600832889"
				sky.SkyboxRt = "rbxassetid://600833001"
				sky.SkyboxUp = "rbxassetid://600833186"
				sky.StarCount = 1000
				sky.SunTextureId = "rbxassetid://619666510"
				sky.Parent = Lighting

				Lighting.TimeOfDay = "17:45:00"
				Lighting.ClockTime = 17.75
				Lighting.OutdoorAmbient = Color3.fromRGB(255, 140, 180)
				Lighting.ColorShift_Top = Color3.fromRGB(255, 170, 80)
			end)
		else
			sunsetLbl.Text = "CÉU ENTARDECER"
			pcall(function()
				local oldSky = Lighting:FindFirstChild("HZ_SunsetSky")
				if oldSky then oldSky:Destroy() end
				Lighting.TimeOfDay = "14:00:00"
				Lighting.ClockTime = 14
				Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
				Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
			end)
		end
	end)
end

--==================================================
-- ABA: OUTROS...
--==================================================

local function buildOutros()

	clearContent()
	limparRegistros()
	task.wait(0.15)

	local scrollO = Instance.new("ScrollingFrame")
	scrollO.Size = UDim2.new(1, 0, 1, 0)
	scrollO.BackgroundTransparency = 1
	scrollO.BorderSizePixel = 0
	scrollO.ScrollBarThickness = 4
	scrollO.ScrollBarImageColor3 = GREEN
	scrollO.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollO.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollO.Parent = contentArea

	local listO = Instance.new("UIListLayout")
	listO.Padding = UDim.new(0, 6)
	listO.SortOrder = Enum.SortOrder.LayoutOrder
	listO.Parent = scrollO

	local spawnBtn, spawnLbl   = makeBtn3D(scrollO, "TELEPORTAR PRA SPAWN", "Volta pro início do mapa")
	local cameraBtn, cameraLbl = makeBtn3D(scrollO, "MODO CÂMERA", "Câmera livre pelo mapa")
	local otimBtn, otimLbl     = makeBtn3D(scrollO, "OTIMIZAR GRÁFICOS", "Deixa o jogo mais leve")
	local copiarBtn, copiarLbl = makeBtn3D(scrollO, "COPIAR INFO DO JOGO", "Copia dados do servidor")

	registrarBotao("TELEPORTAR PRA SPAWN", "Volta pro início do mapa", spawnBtn)
	registrarBotao("MODO CÂMERA", "Câmera livre pelo mapa", cameraBtn)
	registrarBotao("OTIMIZAR GRÁFICOS", "Deixa o jogo mais leve", otimBtn)
	registrarBotao("COPIAR INFO DO JOGO", "Copia dados do servidor", copiarBtn)

	spawnBtn.MouseButton1Click:Connect(function()
		local char = player.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		if not root then return end

		local spawn = workspace:FindFirstChildOfClass("SpawnLocation")
		if spawn then
			root.CFrame = spawn.CFrame + Vector3.new(0, 5, 0)
			spawnLbl.Text = "TELEPORTADO!"
			task.wait(1.5)
			spawnLbl.Text = "TELEPORTAR PRA SPAWN"
		else
			spawnLbl.Text = "SEM SPAWN NO MAPA"
			task.wait(1.5)
			spawnLbl.Text = "TELEPORTAR PRA SPAWN"
		end
	end)

	local cameraOn = false

	cameraBtn.MouseButton1Click:Connect(function()
		cameraOn = not cameraOn
		local cam = workspace.CurrentCamera

		if cameraOn then
			cameraLbl.Text = "CÂMERA: ON"
			cam.CameraType = Enum.CameraType.Scriptable
		else
			cameraLbl.Text = "MODO CÂMERA"
			cam.CameraType = Enum.CameraType.Custom
			local char = player.Character
			if char then
				local hum = char:FindFirstChildOfClass("Humanoid")
				if hum then cam.CameraSubject = hum end
			end
		end
	end)

	local otimOn = false

	otimBtn.MouseButton1Click:Connect(function()
		otimOn = not otimOn

		if otimOn then
			otimLbl.Text = "OTIMIZADO: ON"
			pcall(function()
				Lighting.GlobalShadows = false
				Lighting.FogEnd = 100000
				Lighting.Brightness = 2
				for _, v in pairs(Lighting:GetChildren()) do
					if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
						v.Enabled = false
					end
				end
				settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
			end)
		else
			otimLbl.Text = "OTIMIZAR GRÁFICOS"
			pcall(function()
				Lighting.GlobalShadows = true
				settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
			end)
		end
	end)

	copiarBtn.MouseButton1Click:Connect(function()
		local info = "🎮 DYV HUB - Info do Servidor\n"
		info = info .. "👥 Players: " .. #Players:GetPlayers() .. "\n"
		info = info .. "🌍 Jogo: " .. game.PlaceId .. "\n"
		info = info .. "📛 Nome: " .. player.Name .. "\n"
		info = info .. "👑 Dono: Deyvin (ph_deyvinn3)\n"
		info = info .. "💬 Discord: discord.gg/4RqVr27N"

		if setclipboard then
			setclipboard(info)
			copiarLbl.Text = "COPIADO!"
			task.wait(1.5)
			copiarLbl.Text = "COPIAR INFO DO JOGO"
		else
			copiarLbl.Text = "NÃO SUPORTADO"
			task.wait(1.5)
			copiarLbl.Text = "COPIAR INFO DO JOGO"
		end
	end)
end

--==================================================
-- ABA: CRÉDITOS
--==================================================

local function buildCredits()
	clearContent()
	limparRegistros()

	local credits = Instance.new("TextLabel")
	credits.Size = UDim2.new(1, 0, 1, 0)
	credits.BackgroundTransparency = 1
	credits.TextColor3 = GREEN
	credits.TextSize = 13
	credits.Font = FONTE
	credits.TextWrapped = true
	credits.TextYAlignment = Enum.TextYAlignment.Top
	credits.TextXAlignment = Enum.TextXAlignment.Left
	credits.RichText = true
	credits.Parent = contentArea

	credits.Text = [[
<b>🤖  IA:</b>
<font color="rgb(50,255,120)">DeepSeek</font>
<font size="10" color="rgb(180,180,180)">Responsavel pela maioria das funcoes e scripts.</font>

<b>👑  FUNDADOR:</b>
<font color="rgb(50,255,120)">Deyvin</font>
<font size="10" color="rgb(180,180,180)">Nick: ph_deyvinn3</font>

<b>🎖️  SUB-DONO:</b>
<font color="rgb(50,255,120)">Dino</font>
<font size="10" color="rgb(180,180,180)">Ajuda na comunidade e suporte.</font>

<b>💚  MENSAGEM:</b>
<font size="11" color="rgb(50,255,120)">"Crescendo a cada dia!"</font>

<b>🔗  COMUNIDADE:</b>
<font size="10" color="rgb(180,180,180)">discord.gg/4RqVr27N</font>
]]
end

--==================================================
-- BOTÕES DO SIDEBAR (8 ABAS)
--==================================================

createSidebarButton("Players", 6, function()
	selectTab(1, "PLAYERS")
	buildPlayersList()
end)

createSidebarButton("Jogador", 38, function()
	selectTab(2, "JOGADOR")
	buildPlayer()
end)

createSidebarButton("Funções", 70, function()
	selectTab(3, "FUNÇÕES")
	buildFunctions()
end)

createSidebarButton("Mira e Apelações", 102, function()
	selectTab(4, "MIRA E APELAÇÕES")
	buildMira()
end)

createSidebarButton("Música", 134, function()
	selectTab(5, "MÚSICA")
	buildMusic()
end)

createSidebarButton("Preferências", 166, function()
	selectTab(6, "PREFERÊNCIAS")
	buildPreferences()
end)

createSidebarButton("Outros...", 198, function()
	selectTab(7, "OUTROS")
	buildOutros()
end)

createSidebarButton("Créditos", 230, function()
	selectTab(8, "CRÉDITOS")
	buildCredits()
end)

--==================================================
-- LÓGICA DA LUPA
--==================================================

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local texto = searchBox.Text:lower()

	if texto == "" then
		for _, item in ipairs(currentTabButtons) do
			item.btn.Visible = true
		end
	else
		for _, item in ipairs(currentTabButtons) do
			local nome = item.nome:lower()
			local desc = item.descricao:lower()
			if nome:find(texto, 1, true) or desc:find(texto, 1, true) then
				item.btn.Visible = true
			else
				item.btn.Visible = false
			end
		end
	end
end)

--==================================================
-- BOTÃO DO MENU
--==================================================

local toggle = Instance.new("ImageButton")
toggle.Size = UDim2.fromOffset(50, 50)
toggle.Position = UDim2.new(1, -62, 0, 15)
toggle.BackgroundColor3 = BLACK
toggle.Image = ICONE
toggle.ImageColor3 = WHITE
toggle.AutoButtonColor = false
toggle.Parent = gui

local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(0, 14); tc.Parent = toggle
local ts = Instance.new("UIStroke"); ts.Color = GREEN; ts.Thickness = 2; ts.Transparency = 0.2; ts.Parent = toggle

task.spawn(function()
	while ts.Parent do
		for i = 0, 1, 0.1 do
			ts.Transparency = 0.2 + (0.5 * i)
			task.wait(0.05)
		end
		for i = 0, 1, 0.1 do
			ts.Transparency = 0.7 - (0.5 * i)
			task.wait(0.05)
		end
	end
end)

local toggleDragging = false
local toggleDragStart
local toggleStartPos
local toggleMoved = false

toggle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		toggleDragging = true
		toggleMoved = false
		toggleDragStart = input.Position
		toggleStartPos = toggle.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then toggleDragging = false end
		end)
	end
end)

local function updateTogglePos(input)
	local delta = input.Position - toggleDragStart
	if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then toggleMoved = true end
	toggle.Position = UDim2.new(
		toggleStartPos.X.Scale, toggleStartPos.X.Offset + delta.X,
		toggleStartPos.Y.Scale, toggleStartPos.Y.Offset + delta.Y
	)
end

toggle.InputChanged:Connect(function(input)
	if toggleDragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		updateTogglePos(input)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if toggleDragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		updateTogglePos(input)
	end
end)

local openSound = Instance.new("Sound")
openSound.SoundId = "rbxassetid://118702070205579"
openSound.Volume = 1
openSound.Parent = gui

--==================================================
-- ARRASTAR MENU
--==================================================

local dragging = false
local dragStart
local startPos

local function updateDrag(input)
	local delta = input.Position - dragStart
	main.Position = UDim2.new(
		startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y
	)
end

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

main.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		updateDrag(input)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		updateDrag(input)
	end
end)

--==================================================
-- ABRIR / FECHAR
--==================================================

local menuOpen = true

toggle.MouseButton1Click:Connect(function()
	if toggleMoved then
		toggleMoved = false
		return
	end
	menuOpen = not menuOpen
	if menuOpen then
		openSound.TimePosition = 0
		openSound:Play()
		main.Visible = true
		main.BackgroundTransparency = 1
		TweenService:Create(main, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
	else
		TweenService:Create(main, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
		task.wait(0.4)
		if not menuOpen then main.Visible = false end
	end
end)

--==================================================
-- INICIA NA ABA PLAYERS
--==================================================

task.wait(0.7)
sidebarButtons[1].btn.MouseButton1Click:Fire()
