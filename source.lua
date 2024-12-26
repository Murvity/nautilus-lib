-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")

-- Variables
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
local Viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}

-- Compare and contrast values within options table to nil
function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end


function Library:new(options)
	options = Library:validate({
		name = "NAUTILUS"
	}, options or {})
	
	local GUI = {
		CurrentTab = nil,
		StartDrag = nil,
		Dragging = false,
		StartPos = nil,
		Hover = false,
		Hover2 = false,
		Hover3 = false,
		Done = false,
		InactiveTabs = {},
		InactiveTabs2 = {},
		InactiveTabs3 = {},
		InactiveContents = {}
	}
	
	-- Main Frame
	do
		-- StarterGui.MyLibrary
		GUI["1"] = Instance.new("ScreenGui", RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or CoreGui);
		GUI["1"]["Name"] = [[MyLibrary]];
		GUI["1"]["IgnoreGuiInset"] = true


		-- StarterGui.MyLibrary.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(5, 5, 20);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		GUI["2"]["Position"] = UDim2.fromOffset((Viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (Viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Name"] = [[Main]];


		-- StarterGui.MyLibrary.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.MyLibrary.Main.DropShadowHolder
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 0;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4"]["Name"] = [[DropShadowHolder]];
		GUI["4"]["BackgroundTransparency"] = 1;


		-- StarterGui.MyLibrary.Main.DropShadowHolder.DropShadow
		GUI["5"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["5"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["5"]["ImageTransparency"] = 0.5;
		GUI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://6014261993]];
		GUI["5"]["Size"] = UDim2.new(1, 50, 1, 50);
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Name"] = [[DropShadow]];
		GUI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.MyLibrary.Main.TopBar
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(3, 3, 8);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Name"] = [[TopBar]];


		-- StarterGui.MyLibrary.Main.TopBar.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 6);


		-- StarterGui.MyLibrary.Main.TopBar.Extension
		GUI["8"] = Instance.new("Frame", GUI["6"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(3, 3, 8);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["8"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["Name"] = [[Extension]];


		-- StarterGui.MyLibrary.Main.TopBar.Line
		GUI["9"] = Instance.new("Frame", GUI["6"]);
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 67);
		GUI["9"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["9"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["9"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["9"]["Name"] = [[Line]];


		-- StarterGui.MyLibrary.Main.TopBar.Shell
		GUI["a"] = Instance.new("ImageLabel", GUI["6"]);
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(2, 6, 255);
		GUI["a"]["ScaleType"] = Enum.ScaleType.Fit;
		GUI["a"]["ImageColor3"] = Color3.fromRGB(76, 76, 182);
		GUI["a"]["Image"] = [[rbxassetid://126678697203229]];
		GUI["a"]["Size"] = UDim2.new(0, 18, 0, 18);
		GUI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["a"]["BackgroundTransparency"] = 1;
		GUI["a"]["Name"] = [[Shell]];
		GUI["a"]["Position"] = UDim2.new(0, 6, 0, 6);


		-- StarterGui.MyLibrary.Main.TopBar.NAUTILUS
		GUI["b"] = Instance.new("TextLabel", GUI["6"]);
		GUI["b"]["TextWrapped"] = true;
		GUI["b"]["LineHeight"] = 0;
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["b"]["TextSize"] = 18;
		GUI["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["b"]["TextColor3"] = Color3.fromRGB(63, 63, 150);
		GUI["b"]["BackgroundTransparency"] = 1;
		GUI["b"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["b"]["Text"] = [[NAUTILUS]];
		GUI["b"]["Name"] = [[NAUTILUS]];


		-- StarterGui.MyLibrary.Main.TopBar.NAUTILUS.UIPadding
		GUI["c"] = Instance.new("UIPadding", GUI["b"]);
		GUI["c"]["PaddingTop"] = UDim.new(0, -2);
		GUI["c"]["PaddingLeft"] = UDim.new(0, 29);


		-- StarterGui.MyLibrary.Main.TopBar.Exit1
		GUI["d"] = Instance.new("ImageButton", GUI["6"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["d"]["ImageColor3"] = Color3.fromRGB(32, 32, 77);
		GUI["d"]["Image"] = [[rbxassetid://89857762984221]];
		GUI["d"]["Size"] = UDim2.new(0, 20, 0, 20);
		GUI["d"]["BackgroundTransparency"] = 1;
		GUI["d"]["Name"] = [[Exit1]];
		GUI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["d"]["Position"] = UDim2.new(1, -24, 0, 5);
		GUI["d"]["ZIndex"] = 5


		-- StarterGui.MyLibrary.Main.TopBar.Minimize1
		GUI["1e"] = Instance.new("ImageButton", GUI["6"]);
		GUI["1e"]["BorderSizePixel"] = 0;
		GUI["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["1e"]["ImageColor3"] = Color3.fromRGB(32, 32, 77);
		GUI["1e"]["Image"] = [[rbxassetid://75333583359777]];
		GUI["1e"]["Size"] = UDim2.new(0, 16, 0, 16);
		GUI["1e"]["BackgroundTransparency"] = 1;
		GUI["1e"]["Name"] = [[Minimize1]];
		GUI["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1e"]["Position"] = UDim2.new(1, -44, 0, 7);
		GUI["1e"]["ZIndex"] = 5
		
		-- StarterGui.MyLibrary.Main.Contents
		GUI["1c"] = Instance.new("Frame", GUI["2"]);
		GUI["1c"]["BorderSizePixel"] = 0;
		GUI["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["1c"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["1c"]["Size"] = UDim2.new(1, -133, 1, -42);
		GUI["1c"]["Position"] = UDim2.new(1, -6, 0, 36);
		GUI["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1c"]["Name"] = [[Contents]];
		GUI["1c"]["BackgroundTransparency"] = 1;
	end
	
	-- Navigation
	do
		-- StarterGui.MyLibrary.Main.Navigation
		GUI["e"] = Instance.new("Frame", GUI["2"]);
		GUI["e"]["BorderSizePixel"] = 0;
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 30);
		GUI["e"]["Size"] = UDim2.new(0, 120, 1, -31);
		GUI["e"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["e"]["Name"] = [[Navigation]];


		-- StarterGui.MyLibrary.Main.Navigation.UICorner
		GUI["f"] = Instance.new("UICorner", GUI["e"]);



		-- StarterGui.MyLibrary.Main.Navigation.Hide
		GUI["10"] = Instance.new("Frame", GUI["e"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 30);
		GUI["10"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["10"]["Name"] = [[Hide]];


		-- StarterGui.MyLibrary.Main.Navigation.Hide2
		GUI["11"] = Instance.new("Frame", GUI["e"]);
		GUI["11"]["BorderSizePixel"] = 0;
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 30);
		GUI["11"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["11"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["11"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["11"]["Name"] = [[Hide2]];


		-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder
		GUI["12"] = Instance.new("Frame", GUI["e"]);
		GUI["12"]["BorderSizePixel"] = 0;
		GUI["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["12"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["12"]["Name"] = [[ButtonHolder]];
		GUI["12"]["BackgroundTransparency"] = 1;


		-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.UIPadding
		GUI["13"] = Instance.new("UIPadding", GUI["12"]);
		GUI["13"]["PaddingTop"] = UDim.new(0, 8);
		GUI["13"]["PaddingBottom"] = UDim.new(0, 8);


		-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.UIListLayout
		GUI["14"] = Instance.new("UIListLayout", GUI["12"]);
		GUI["14"]["Padding"] = UDim.new(0, 1);
		GUI["14"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		
		-- StarterGui.MyLibrary.Main.Navigation.Line
		GUI["1b"] = Instance.new("Frame", GUI["e"]);
		GUI["1b"]["BorderSizePixel"] = 0;
		GUI["1b"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 67);
		GUI["1b"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["1b"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1b"]["Name"] = [[Line]];
	end
	
	-- Top Bar Logic
	do
		-- For dragging
		GUI["6"].MouseEnter:Connect(function()
			GUI.Hover = true
		end)

		GUI["6"].MouseLeave:Connect(function()
			GUI.Hover = false
		end)
		
		
		UIS.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if GUI.Hover then
					if GUI["6"] and GUI["6"].Parent then
						GUI.Dragging = true
						GUI.StartDrag = input.Position
						GUI.StartPos = GUI["6"].Parent["Position"]
						
						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								GUI.Dragging = false
							end
						end)
					end
				end
			end
		end)
		
		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				if GUI.Hover then
					if GUI.Dragging then
						if GUI["6"] and GUI["6"].Parent then
							local Delta = input.Position - GUI.StartDrag
							GUI["6"].Parent["Position"] = UDim2.new(GUI.StartPos.X.Scale, GUI.StartPos.X.Offset + Delta.X, GUI.StartPos.Y.Scale, GUI.StartPos.Y.Offset + Delta.Y)
						end
					end
				end
			end
		end)
		
		
		
		
		
		-- For minimize button
		GUI["1e"].MouseEnter:Connect(function()
			Library:tween(GUI["1e"], {ImageColor3 = Color3.fromRGB(74, 74, 180)})
			GUI.Hover2 = true
		end)

		GUI["1e"].MouseLeave:Connect(function()
			Library:tween(GUI["1e"], {ImageColor3 = Color3.fromRGB(32, 32, 77)})
			GUI.Hover2 = false
		end)

		UIS.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if GUI.Hover2 and not GUI.Done then
					Library:tween(GUI["6"], {Size = UDim2.new(0, 75, 0, 30)})
					GUI["1e"]["Image"] = [[rbxassetid://83494634417832]]
					for _, v in ipairs(GUI["1c"]:GetChildren()) do
						if v:IsA("ScrollingFrame") and v.Visible == false then
							table.insert(GUI.InactiveContents, v)
						end
					end
					
					for _, v in ipairs(GUI["1"]:GetDescendants()) do
						if v:IsA("ScrollingFrame") and v.Parent.Name == "Contents" then
							if v.Name == "Main" and v.Visible == false then
								table.insert(GUI.InactiveTabs3, v)
							end
						end
						
						if v.Name == "Checkmark" and v.ImageTransparency == 1 then
							table.insert(GUI.InactiveTabs2, v)
						end
						
						if v.Name == "Inactive-MainTab" and v.BackgroundTransparency == 1 then
							if v.TextColor3 ~= Color3.fromRGB(74, 74, 180) then
								table.insert(GUI.InactiveTabs, v)
							end
						end
						
						if v.Name ~= GUI["6"].Name then
							if v:IsA("Frame") then
								Library:tween(v, {BackgroundTransparency = 1})
							end
							
							if v:IsA("TextLabel") then
								Library:tween(v, {BackgroundTransparency = 1})
								Library:tween(v, {TextTransparency = 1})
							end
							
							if v:IsA("ImageLabel") then
								Library:tween(v, {ImageTransparency = 1})
							end
							
							if v:IsA("UIStroke") then
								Library:tween(v, {Transparency = 1})
							end
						end
					end
					
					for _, v in ipairs(GUI["2"]:GetChildren()) do
						if v.Name ~= "TopBar" then
							for _, v2 in ipairs(v:GetDescendants()) do
								if v2:IsA("GuiObject") then
									v2.Visible = false
								end
							end
						end
					end
					GUI.Done = not GUI.Done
				elseif GUI.Hover2 and GUI.Done then
					for _, v in ipairs(GUI["2"]:GetChildren()) do
						if v.Name ~= "TopBar" then
							for _, v2 in ipairs(v:GetDescendants()) do
								if v2:IsA("GuiObject") and v2.Name ~= "OptionHolder" then
									if v2 ~= GUI.InactiveContents[1] then
										v2.Visible = true
									end
								end
							end
						end
					end
					Library:tween(GUI["6"], {Size = UDim2.new(1, 0, 0, 30)})
					GUI["1e"]["Image"] = [[rbxassetid://75333583359777]]
					for _, v in ipairs(GUI["1"]:GetDescendants()) do
						if v.Name ~= GUI["6"].Name and v.Name ~= "ButtonHolder" and v.Name ~= "Contents" then
							if v.Name ~= "DropShadowHolder" and v.Name ~= "OptionHolder" then
								if v:IsA("Frame") then
									for _, v in ipairs(GUI.InactiveTabs3) do
										v.Visible = false
									end
									
									Library:tween(v, {BackgroundTransparency = 0})
								end

								if v:IsA("TextLabel") then
									if v.Name == "Inactive-MainTab" then
										Library:tween(v, {BackgroundTransparency = 0})
									end
									
									if v.Name == "Inactive Option" then
										Library:tween(v, {BackgroundTransparency = 0})
									end
									
									for _, v in ipairs(GUI.InactiveTabs) do
										Library:tween(v, {BackgroundTransparency = 1})
									end

									Library:tween(v, {TextTransparency = 0})
								end

								if v:IsA("ImageLabel") then
									Library:tween(v, {ImageTransparency = 0})
									
									for _, v in ipairs(GUI.InactiveTabs2) do
										Library:tween(v, {ImageTransparency = 1})
									end
								end
								
								if v:IsA("UIStroke") then
									Library:tween(v, {Transparency = 0})
								end
								
								if v.Name == "DropShadow" then
									Library:tween(v, {ImageTransparency = 0.5})
								end
							end
						end
					end
					GUI.Done = not GUI.Done
					GUI.InactiveTabs = {}
					GUI.InactiveTabs2 = {}
					GUI.InactiveTabs3 = {}
					GUI.InactiveContents = {}
				end
			end
		end)
		
		
		
		
		
		
		
		-- For exiting
		GUI["d"].MouseEnter:Connect(function()
			Library:tween(GUI["d"], {ImageColor3 = Color3.fromRGB(74, 74, 180)})
			GUI.Hover3 = true
		end)

		GUI["d"].MouseLeave:Connect(function()
			Library:tween(GUI["d"], {ImageColor3 = Color3.fromRGB(32, 32, 77)})
			GUI.Hover3 = false
		end)

		UIS.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if GUI.Hover3 then
					for i, v in pairs(GUI["1"]:GetDescendants()) do
						if v:IsA("Frame") then
							Library:tween(v, {BackgroundTransparency = 1})
						end

						if v:IsA("TextLabel") then
							Library:tween(v, {BackgroundTransparency = 1})
							Library:tween(v, {TextTransparency = 1})
						end

						if v:IsA("ImageLabel") then
							Library:tween(v, {ImageTransparency = 1})
						end

						if v:IsA("ImageButton") then
							Library:tween(v, {BackgroundTransparency = 1})
							Library:tween(v, {ImageTransparency = 1})
						end
						
						if v:IsA("UIStroke") then
							Library:tween(v, {Transparency = 1})
						end
					end
					task.wait(1)
					GUI["1"]:Destroy()
				end
			end
		end)
	end
	
	
	-- Control functions / methods
	function GUI:CreateTab(options)
		options = Library:validate({
			title = "Main",
			icon = "rbxassetid://135715858500363"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false,
			Test = false
		}
		
		
		-- Tab Render
		do
			-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive-MainTab
			Tab["18"] = Instance.new("TextLabel", GUI["12"]);
			Tab["18"]["BorderSizePixel"] = 0;
			Tab["18"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["18"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 50);
			Tab["18"]["TextSize"] = 14;
			Tab["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Tab["18"]["TextColor3"] = Color3.fromRGB(33, 33, 78);
			Tab["18"]["BackgroundTransparency"] = 1;
			Tab["18"]["Size"] = UDim2.new(1, 0, 0, 24);
			Tab["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["18"]["Text"] = options.title;
			Tab["18"]["Name"] = [[Inactive-MainTab]];


			-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive-MainTab.UIPadding
			Tab["19"] = Instance.new("UIPadding", Tab["18"]);
			Tab["19"]["PaddingLeft"] = UDim.new(0, 28);


			-- StarterGui.MyLibrary.Main.Navigation.ButtonHolder.Inactive-MainTab.Icon
			Tab["1a"] = Instance.new("ImageLabel", Tab["18"]);
			Tab["1a"]["BorderSizePixel"] = 0;
			Tab["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1a"]["ImageColor3"] = Color3.fromRGB(33, 33, 78);
			Tab["1a"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["1a"]["Image"] = options.icon;
			Tab["1a"]["Size"] = UDim2.new(0, 15, 0, 15);
			Tab["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1a"]["BackgroundTransparency"] = 1;
			Tab["1a"]["Name"] = [[Icon]];
			Tab["1a"]["Position"] = UDim2.new(0, -22, 0.5, 0);
			
			
			-- StarterGui.MyLibrary.Main.Contents.Main
			Tab["1d"] = Instance.new("ScrollingFrame", GUI["1c"]);
			Tab["1d"]["BorderSizePixel"] = 0;
			Tab["1d"]["BackgroundColor3"] = Color3.fromRGB(2, 2, 8);
			Tab["1d"]["Name"] = [[Main]];
			Tab["1d"]["Selectable"] = false;
			Tab["1d"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1d"]["ScrollBarThickness"] = 0;
			Tab["1d"]["BackgroundTransparency"] = 1;
			Tab["1d"]["Visible"] = false;
			
			
			-- StarterGui.MyLibrary.Main.Contents.Main.UIPadding
			Tab["24"] = Instance.new("UIPadding", Tab["1d"]);
			Tab["24"]["PaddingTop"] = UDim.new(0, 1);
			Tab["24"]["PaddingRight"] = UDim.new(0, 1);
			Tab["24"]["PaddingLeft"] = UDim.new(0, 1);
			Tab["24"]["PaddingBottom"] = UDim.new(0, 1);


			-- StarterGui.MyLibrary.Main.Contents.Main.UIListLayout
			Tab["25"] = Instance.new("UIListLayout", Tab["1d"]);
			Tab["25"]["Padding"] = UDim.new(0, 8);
			Tab["25"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		end
		
		-- Functions / methods
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				
				Tab.Active = true
				Library:tween(Tab["18"], {TextColor3 = Color3.fromRGB(74, 74, 180)})
				Library:tween(Tab["1a"], {ImageColor3 = Color3.fromRGB(74, 74, 180)})
				Library:tween(Tab["18"], {BackgroundTransparency = 0})
				Tab["1d"].Visible = true
				task.wait(0.035)
				for _, v in ipairs(Tab["1d"]:GetDescendants()) do
					if v:IsA("Frame") then
						if v.Name ~= "OptionHolder" then
							Library:tween(v, {BackgroundTransparency = 0})
						end
					end

					if v:IsA("TextLabel") then
						if v.Name == "Inactive Option" then
							Library:tween(v, {BackgroundTransparency = 0})
						end
						Library:tween(v, {TextTransparency = 0})
					end

					if v:IsA("ImageLabel") then
						if Tab.Test == true then
							Library:tween(v, {ImageTransparency = 0})
						elseif v.Name ~= "Checkmark" then
							Library:tween(v, {ImageTransparency = 0})
						end
					end

					if v:IsA("UIStroke") then
						Library:tween(v, {Transparency = 0})
					end
				end
				
				GUI.CurrentTab = Tab
				Tab.Test = false
			end
			
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				for _, v in ipairs(Tab["1d"]:GetDescendants()) do
					if v.Name == "Checkmark" and v.ImageTransparency == 0 then
						Tab.Test = true
					end
					if v:IsA("Frame") then
						Library:tween(v, {BackgroundTransparency = 1})
					end

					if v:IsA("TextLabel") then
						Library:tween(v, {BackgroundTransparency = 1})
						Library:tween(v, {TextTransparency = 1})
					end

					if v:IsA("ImageLabel") then
						Library:tween(v, {ImageTransparency = 1})
					end

					if v:IsA("UIStroke") then
						Library:tween(v, {Transparency = 1})
					end
				end
				task.wait(0.035)
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["18"], {TextColor3 = Color3.fromRGB(32, 32, 77)})
				Library:tween(Tab["1a"], {ImageColor3 = Color3.fromRGB(32, 32, 77)})
				Library:tween(Tab["18"], {BackgroundTransparency = 1})
				Tab["1d"].Visible = false
			end
		end
		
		-- Tab Logic
		do
			Tab["18"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["18"], {TextColor3 = Color3.fromRGB(74, 74, 180)})
					Library:tween(Tab["1a"], {ImageColor3 = Color3.fromRGB(74, 74, 180)})
				end
			end)


			Tab["18"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Library:tween(Tab["18"], {TextColor3 = Color3.fromRGB(32, 32, 77)})
					Library:tween(Tab["1a"], {ImageColor3 = Color3.fromRGB(32, 32, 77)})
				end
			end)


			UIS.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)
			
			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:CreateButton(options)
			options = Library:validate({
				title = "Button",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			-- Button Render
			do		
				-- StarterGui.MyLibrary.Main.Contents.Main.Button
				Button["1e"] = Instance.new("Frame", Tab["1d"]);
				Button["1e"]["BorderSizePixel"] = 0;
				Button["1e"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 30);
				Button["1e"]["Size"] = UDim2.new(1, 0, 0, 32);
				Button["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1e"]["Name"] = [[Button]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Button.UICorner
				Button["1f"] = Instance.new("UICorner", Button["1e"]);
				Button["1f"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.MyLibrary.Main.Contents.Main.Button.UIStroke
				Button["20"] = Instance.new("UIStroke", Button["1e"]);
				Button["20"]["Color"] = Color3.fromRGB(28, 28, 67);


				-- StarterGui.MyLibrary.Main.Contents.Main.Button.Title
				Button["21"] = Instance.new("TextLabel", Button["1e"]);
				Button["21"]["BorderSizePixel"] = 0;
				Button["21"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["21"]["TextSize"] = 14;
				Button["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["21"]["TextColor3"] = Color3.fromRGB(75, 75, 181);
				Button["21"]["BackgroundTransparency"] = 1;
				Button["21"]["Size"] = UDim2.new(1, 0, 1, 0);
				Button["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["21"]["Text"] = options.title;
				Button["21"]["Name"] = [[Title]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Button.UIPadding
				Button["22"] = Instance.new("UIPadding", Button["1e"]);
				Button["22"]["PaddingTop"] = UDim.new(0, 6);
				Button["22"]["PaddingRight"] = UDim.new(0, 6);
				Button["22"]["PaddingLeft"] = UDim.new(0, 6);
				Button["22"]["PaddingBottom"] = UDim.new(0, 6);


				-- StarterGui.MyLibrary.Main.Contents.Main.Button.Icon
				Button["23"] = Instance.new("ImageLabel", Button["1e"]);
				Button["23"]["BorderSizePixel"] = 0;
				Button["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["23"]["ImageColor3"] = Color3.fromRGB(75, 75, 181);
				Button["23"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["23"]["Image"] = [[rbxassetid://82270410922788]];
				Button["23"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["23"]["BackgroundTransparency"] = 1;
				Button["23"]["Name"] = [[Icon]];
				Button["23"]["Position"] = UDim2.new(1, 0, 0, 0);
			end
			
			-- Button functions / methods
			function Button:SetText(text)
				Button["21"].Text = text
			end
			
			function Button:SetCallback(fn)
				options.callback = fn
			end
			
			-- Button Logic
			do
				Button["1e"].MouseEnter:Connect(function()
					Button.Hover = true
					Library:tween(Button["20"], {Color = Color3.fromRGB(55, 55, 134)})
				end)
				
				Button["1e"].MouseLeave:Connect(function()
					Button.Hover = false
					if not Button.MouseDown then
						Library:tween(Button["20"], {Color = Color3.fromRGB(27, 27, 66)})
					end
				end)
				
				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["1e"], {BackgroundColor3 = Color3.fromRGB(15, 15, 57)})
						Library:tween(Button["20"], {Color = Color3.fromRGB(55, 55, 134)})
						options.callback()
					end
				end)
				
				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						if Button.Hover then
							Library:tween(Button["1e"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Button["20"], {Color = Color3.fromRGB(55, 55, 134)})
						else
							Library:tween(Button["1e"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Button["20"], {Color = Color3.fromRGB(27, 27, 66)})
						end
					end
				end)
			end
			
			return Button
		end
		
		function Tab:CreateSlider(options)
			options = Library:validate({
				title = "Slider",
				min = 0,
				max = 100,
				default = 50,
				callback = function(v) end
			}, options or {})
			
			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil
			}
			
			-- Slider Render
			do
				-- StarterGui.MyLibrary.Main.Contents.Main.Slider
				Slider["3d"] = Instance.new("Frame", Tab["1d"]);
				Slider["3d"]["BorderSizePixel"] = 0;
				Slider["3d"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 30);
				Slider["3d"]["Size"] = UDim2.new(1, 0, 0, 38);
				Slider["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["3d"]["Name"] = [[Slider]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.UICorner
				Slider["3e"] = Instance.new("UICorner", Slider["3d"]);
				Slider["3e"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.UIStroke
				Slider["3f"] = Instance.new("UIStroke", Slider["3d"]);
				Slider["3f"]["Color"] = Color3.fromRGB(28, 28, 67);


				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.Title
				Slider["40"] = Instance.new("TextLabel", Slider["3d"]);
				Slider["40"]["BorderSizePixel"] = 0;
				Slider["40"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["40"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["40"]["TextSize"] = 14;
				Slider["40"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["40"]["TextColor3"] = Color3.fromRGB(75, 75, 181);
				Slider["40"]["BackgroundTransparency"] = 1;
				Slider["40"]["Size"] = UDim2.new(1, -24, 1, -10);
				Slider["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["40"]["Text"] = options.title;
				Slider["40"]["Name"] = [[Title]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.UIPadding
				Slider["41"] = Instance.new("UIPadding", Slider["3d"]);
				Slider["41"]["PaddingTop"] = UDim.new(0, 6);
				Slider["41"]["PaddingRight"] = UDim.new(0, 6);
				Slider["41"]["PaddingLeft"] = UDim.new(0, 6);
				Slider["41"]["PaddingBottom"] = UDim.new(0, 6);


				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.Value
				Slider["42"] = Instance.new("TextLabel", Slider["3d"]);
				Slider["42"]["BorderSizePixel"] = 0;
				Slider["42"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["42"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["42"]["TextSize"] = 14;
				Slider["42"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["42"]["TextColor3"] = Color3.fromRGB(75, 75, 181);
				Slider["42"]["BackgroundTransparency"] = 1;
				Slider["42"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["42"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["42"]["Text"] = tostring(options.default);
				Slider["42"]["Name"] = [[Value]];
				Slider["42"]["Position"] = UDim2.new(1, 0, 0, 0);


				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.SliderBack
				Slider["43"] = Instance.new("Frame", Slider["3d"]);
				Slider["43"]["BorderSizePixel"] = 0;
				Slider["43"]["BackgroundColor3"] = Color3.fromRGB(3, 3, 9);
				Slider["43"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["43"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["43"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["43"]["Name"] = [[SliderBack]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.SliderBack.UIStroke
				Slider["44"] = Instance.new("UIStroke", Slider["43"]);
				Slider["44"]["Color"] = Color3.fromRGB(27, 27, 66);


				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.SliderBack.Draggable
				Slider["45"] = Instance.new("Frame", Slider["43"]);
				Slider["45"]["BorderSizePixel"] = 0;
				Slider["45"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 68);
				Slider["45"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["45"]["Name"] = [[Draggable]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.SliderBack.Draggable.UICorner
				Slider["46"] = Instance.new("UICorner", Slider["45"]);



				-- StarterGui.MyLibrary.Main.Contents.Main.Slider.SliderBack.UICorner
				Slider["47"] = Instance.new("UICorner", Slider["43"]);
			end
			
			
			-- Functions / methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((Mouse.X - Slider["43"].AbsolutePosition.X) / (Slider["43"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)
					
					Slider["42"].Text = tostring(value)
					Slider["45"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["42"].Text = tostring(v)
					Slider["45"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
				end
				options.callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["42"].Text)
			end
			
			-- Slider Logic
			do
				Slider["3d"].MouseEnter:Connect(function()
					Slider.Hover = true
					Library:tween(Slider["3f"], {Color = Color3.fromRGB(55, 55, 134)})
					Library:tween(Slider["44"], {Color = Color3.fromRGB(55, 55, 134)})
					Library:tween(Slider["45"], {BackgroundColor3 = Color3.fromRGB(55, 55, 134)})
				end)

				Slider["3d"].MouseLeave:Connect(function()
					Slider.Hover = false
					if not Slider.MouseDown then
						Library:tween(Slider["3f"], {Color = Color3.fromRGB(27, 27, 66)})
						Library:tween(Slider["44"], {Color = Color3.fromRGB(27, 27, 66)})
						Library:tween(Slider["45"], {BackgroundColor3 = Color3.fromRGB(27, 27, 66)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["3d"], {BackgroundColor3 = Color3.fromRGB(15, 15, 57)})
						Library:tween(Slider["3f"], {Color = Color3.fromRGB(55, 55, 134)})
						Library:tween(Slider["44"], {Color = Color3.fromRGB(55, 55, 134)})
						Library:tween(Slider["45"], {BackgroundColor3 = Color3.fromRGB(55, 55, 134)})
						
						if not Slider.Connection then
							Slider.Connection = RunService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false
						if Slider.Hover then
							Library:tween(Slider["3d"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Slider["3f"], {Color = Color3.fromRGB(55, 55, 134)})
							Library:tween(Slider["44"], {Color = Color3.fromRGB(55, 55, 134)})
							Library:tween(Slider["45"], {BackgroundColor3 = Color3.fromRGB(55, 55, 134)})
						else
							Library:tween(Slider["3d"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Slider["3f"], {Color = Color3.fromRGB(27, 27, 66)})
							Library:tween(Slider["44"], {Color = Color3.fromRGB(27, 27, 66)})
							Library:tween(Slider["45"], {BackgroundColor3 = Color3.fromRGB(27, 27, 66)})
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)
			end
			
			return Slider
		end
		
		function Tab:CreateToggle(options)
			options = Library:validate({
				title = "Toggle",
				callback = function() end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				Mousedown = false,
				State = false
			}
			
			-- Toggle Render
			do
				-- StarterGui.MyLibrary.Main.Contents.Main.ToggleInactive
				Toggle["51"] = Instance.new("Frame", Tab["1d"]);
				Toggle["51"]["BorderSizePixel"] = 0;
				Toggle["51"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 30);
				Toggle["51"]["Size"] = UDim2.new(1, 0, 0, 32);
				Toggle["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["51"]["Name"] = [[ToggleInactive]];


				-- StarterGui.MyLibrary.Main.Contents.Main.ToggleInactive.UICorner
				Toggle["52"] = Instance.new("UICorner", Toggle["51"]);
				Toggle["52"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.MyLibrary.Main.Contents.Main.ToggleInactive.UIStroke
				Toggle["53"] = Instance.new("UIStroke", Toggle["51"]);
				Toggle["53"]["Color"] = Color3.fromRGB(28, 28, 67);


				-- StarterGui.MyLibrary.Main.Contents.Main.ToggleInactive.Title
				Toggle["54"] = Instance.new("TextLabel", Toggle["51"]);
				Toggle["54"]["BorderSizePixel"] = 0;
				Toggle["54"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["54"]["TextSize"] = 14;
				Toggle["54"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["54"]["TextColor3"] = Color3.fromRGB(75, 75, 181);
				Toggle["54"]["BackgroundTransparency"] = 1;
				Toggle["54"]["Size"] = UDim2.new(1, -30, 1, 0);
				Toggle["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["54"]["Text"] = options.title;
				Toggle["54"]["Name"] = [[Title]];


				-- StarterGui.MyLibrary.Main.Contents.Main.ToggleInactive.UIPadding
				Toggle["55"] = Instance.new("UIPadding", Toggle["51"]);
				Toggle["55"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["55"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["55"]["PaddingLeft"] = UDim.new(0, 6);
				Toggle["55"]["PaddingBottom"] = UDim.new(0, 6);


				-- StarterGui.MyLibrary.Main.Contents.Main.ToggleInactive.CheckmarkHolder
				Toggle["56"] = Instance.new("Frame", Toggle["51"]);
				Toggle["56"]["Active"] = true;
				Toggle["56"]["BorderSizePixel"] = 0;
				Toggle["56"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 30);
				Toggle["56"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["56"]["Size"] = UDim2.new(0, 16, 0, 16);
				Toggle["56"]["Position"] = UDim2.new(1, -2, 0.5, 0);
				Toggle["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["56"]["Name"] = [[CheckmarkHolder]];


				-- StarterGui.MyLibrary.Main.Contents.Main.ToggleInactive.CheckmarkHolder.UICorner
				Toggle["57"] = Instance.new("UICorner", Toggle["56"]);
				Toggle["57"]["CornerRadius"] = UDim.new(0, 3);


				-- StarterGui.MyLibrary.Main.Contents.Main.ToggleInactive.CheckmarkHolder.UIStroke
				Toggle["58"] = Instance.new("UIStroke", Toggle["56"]);
				Toggle["58"]["Color"] = Color3.fromRGB(28, 28, 67);


				-- StarterGui.MyLibrary.Main.Contents.Main.ToggleInactive.CheckmarkHolder.Checkmark
				Toggle["59"] = Instance.new("ImageLabel", Toggle["56"]);
				Toggle["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["59"]["ImageColor3"] = Color3.fromRGB(81, 81, 194);
				Toggle["59"]["ImageTransparency"] = 1
				Toggle["59"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["59"]["Image"] = [[rbxassetid://138347497145448]];
				Toggle["59"]["Size"] = UDim2.new(1, -2, 1, -2);
				Toggle["59"]["Visible"] = true;
				Toggle["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["59"]["BackgroundTransparency"] = 1;
				Toggle["59"]["Name"] = [[Checkmark]];
				Toggle["59"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			end
			
			
			-- Functions / methods
			function Toggle:Toggle(b)
				if b == nil then
					Toggle.State = not Toggle.State
				else
					Toggle.State = b
				end
				
				if Toggle.State then
					Library:tween(Toggle["56"], {BackgroundColor3 = Color3.fromRGB(46, 46, 113)})
					Library:tween(Toggle["59"], {ImageTransparency = 0})
				else
					Library:tween(Toggle["56"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
					Library:tween(Toggle["59"], {ImageTransparency = 1})
				end
				options.callback(Toggle.State)
			end
			
			
			-- Toggle Logic
			do
				Toggle["51"].MouseEnter:Connect(function()
					Toggle.Hover = true
					Library:tween(Toggle["53"], {Color = Color3.fromRGB(55, 55, 134)})
				end)

				Toggle["51"].MouseLeave:Connect(function()
					Toggle.Hover = false
					if not Toggle.MouseDown then
						Library:tween(Toggle["53"], {Color = Color3.fromRGB(27, 27, 66)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["51"], {BackgroundColor3 = Color3.fromRGB(15, 15, 57)})
						Library:tween(Toggle["53"], {Color = Color3.fromRGB(55, 55, 134)})
						Toggle:Toggle()
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false
						if Toggle.Hover then
							Library:tween(Toggle["51"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Toggle["53"], {Color = Color3.fromRGB(55, 55, 134)})
							
						else
							Library:tween(Toggle["51"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Toggle["53"], {Color = Color3.fromRGB(28, 28, 67)})
						end
					end
				end)
			end
			
			return Toggle
		end
		
		function Tab:CreateDropdown(options)
			options = Library:validate({
				title = "Dropdown",
				callback = function() end,
				Items = {}
			}, options or {})
			
			local Dropdown = {
				Items = {
					["id"] = {
						{},
						"value"
					}
				},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false
			}
	
			
			-- Dropdown Render
			do
				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown
				Dropdown["2c"] = Instance.new("Frame", Tab["1d"]);
				Dropdown["2c"]["BorderSizePixel"] = 0;
				Dropdown["2c"]["BackgroundColor3"] = Color3.fromRGB(10, 10, 30);
				Dropdown["2c"]["ClipsDescendants"] = true;
				Dropdown["2c"]["Size"] = UDim2.new(1, 0, 0, 32);
				Dropdown["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2c"]["Name"] = [[Dropdown]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.UICorner
				Dropdown["2d"] = Instance.new("UICorner", Dropdown["2c"]);
				Dropdown["2d"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.UIStroke
				Dropdown["2e"] = Instance.new("UIStroke", Dropdown["2c"]);
				Dropdown["2e"]["Color"] = Color3.fromRGB(28, 28, 67);


				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.Title
				Dropdown["2f"] = Instance.new("TextLabel", Dropdown["2c"]);
				Dropdown["2f"]["BorderSizePixel"] = 0;
				Dropdown["2f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2f"]["TextSize"] = 14;
				Dropdown["2f"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown["2f"]["TextColor3"] = Color3.fromRGB(75, 75, 181);
				Dropdown["2f"]["BackgroundTransparency"] = 1;
				Dropdown["2f"]["Size"] = UDim2.new(1, -30, 0, 20);
				Dropdown["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2f"]["Text"] = options.title;
				Dropdown["2f"]["Name"] = [[Title]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.UIPadding
				Dropdown["30"] = Instance.new("UIPadding", Dropdown["2c"]);
				Dropdown["30"]["PaddingTop"] = UDim.new(0, 6);
				Dropdown["30"]["PaddingRight"] = UDim.new(0, 6);
				Dropdown["30"]["PaddingLeft"] = UDim.new(0, 6);
				Dropdown["30"]["PaddingBottom"] = UDim.new(0, 6);


				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.Icon
				Dropdown["31"] = Instance.new("ImageLabel", Dropdown["2c"]);
				Dropdown["31"]["BorderSizePixel"] = 0;
				Dropdown["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["31"]["ImageColor3"] = Color3.fromRGB(75, 75, 181);
				Dropdown["31"]["AnchorPoint"] = Vector2.new(1, 0);
				Dropdown["31"]["Image"] = [[rbxassetid://80259376199133]];
				Dropdown["31"]["Size"] = UDim2.new(0, 20, 0, 20);
				Dropdown["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["31"]["BackgroundTransparency"] = 1;
				Dropdown["31"]["Name"] = [[Icon]];
				Dropdown["31"]["Position"] = UDim2.new(1, 0, 0, 0);


				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.OptionHolder
				Dropdown["32"] = Instance.new("Frame", Dropdown["2c"]);
				Dropdown["32"]["Visible"] = false;
				Dropdown["32"]["BorderSizePixel"] = 0;
				Dropdown["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["32"]["Size"] = UDim2.new(1, 0, 1, -24);
				Dropdown["32"]["Position"] = UDim2.new(0, 0, 0, 26);
				Dropdown["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["32"]["Name"] = [[OptionHolder]];
				Dropdown["32"]["BackgroundTransparency"] = 1;


				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.OptionHolder.UIListLayout
				Dropdown["33"] = Instance.new("UIListLayout", Dropdown["32"]);
				Dropdown["33"]["Padding"] = UDim.new(0, 8);
				Dropdown["33"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			end
			
			-- Dropdown function / methods
			function Dropdown:Add(id, value)
				local Item = {
					Hover = false,
					MouseDown = false
				}
				if Dropdown.Items[id] ~= nil then
					return
				end
				Dropdown.Items[id] = {
					Instance = {},
					value = value
				}
				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.OptionHolder.Inactive Option
				Dropdown.Items[id].Instance["37"] = Instance.new("TextLabel", Dropdown["32"]);
				Dropdown.Items[id].Instance["37"]["BorderSizePixel"] = 0;
				Dropdown.Items[id].Instance["37"]["BackgroundColor3"] = Color3.fromRGB(13, 13, 39);
				Dropdown.Items[id].Instance["37"]["TextSize"] = 12;
				Dropdown.Items[id].Instance["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown.Items[id].Instance["37"]["TextColor3"] = Color3.fromRGB(75, 75, 181);
				Dropdown.Items[id].Instance["37"]["Text"] = id;
				Dropdown.Items[id].Instance["37"]["Size"] = UDim2.new(1, 0, 0, 18);
				Dropdown.Items[id].Instance["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown.Items[id].Instance["37"]["Name"] = [[Inactive Option]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.OptionHolder.Inactive Option.UIStroke
				Dropdown.Items[id].Instance["38"] = Instance.new("UIStroke", Dropdown.Items[id].Instance["37"]);
				Dropdown.Items[id].Instance["38"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				Dropdown.Items[id].Instance["38"]["Color"] = Color3.fromRGB(28, 28, 67);


				-- StarterGui.MyLibrary.Main.Contents.Main.Dropdown.OptionHolder.Inactive Option.UICorner
				Dropdown.Items[id].Instance["39"] = Instance.new("UICorner",Dropdown.Items[id].Instance["37"]);
				Dropdown.Items[id].Instance["39"]["CornerRadius"] = UDim.new(0, 3);
				
				
				
				
				
				Dropdown.Items[id].Instance["37"].MouseEnter:Connect(function()
					Item.Hover = true
					Dropdown.HoveringItem = true
					
					if Dropdown.Items[id] == nil then return end
					
					Library:tween(Dropdown.Items[id].Instance["38"], {Color = Color3.fromRGB(55, 55, 134)})
				end)

				Dropdown.Items[id].Instance["37"].MouseLeave:Connect(function()
					Item.Hover = false
					Dropdown.HoveringItem = false
					
					if Dropdown.Items[id] == nil then return end
					
					if not Item.MouseDown then
						Library:tween(Dropdown.Items[id].Instance["38"], {Color = Color3.fromRGB(27, 27, 66)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					
					if Dropdown.Items[id] == nil then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
						Item.MouseDown = true
						Library:tween(Dropdown.Items[id].Instance["37"], {BackgroundColor3 = Color3.fromRGB(15, 15, 57)})
						Library:tween(Dropdown.Items[id].Instance["38"], {Color = Color3.fromRGB(55, 55, 134)})
						options.callback(value)
						Dropdown:Toggle()
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end
					
					if Dropdown.Items[id] == nil then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Item.MouseDown = false
						if Item.Hover then
							Library:tween(Dropdown.Items[id].Instance["37"], {BackgroundColor3 = Color3.fromRGB(13, 13, 39)})
							Library:tween(Dropdown.Items[id].Instance["38"], {Color = Color3.fromRGB(55, 55, 134)})
						else
							Library:tween(Dropdown.Items[id].Instance["37"], {BackgroundColor3 = Color3.fromRGB(13, 13, 39)})
							Library:tween(Dropdown.Items[id].Instance["38"], {Color = Color3.fromRGB(27, 27, 66)})
						end
					end
				end)
			end
			
			
			function Dropdown:Remove(id)
				if Dropdown.Items[id] ~= nil then
					if #Dropdown.Items[id].Instance ~= nil then
						for i, v in pairs(Dropdown.Items[id].Instance) do
							v:Destroy()
						end
					end
					Dropdown.Items[id] = nil
				end
			end
			
			
			function Dropdown:Clear()
				for i, v in pairs(Dropdown.Items) do
					Dropdown:Remove(i)
				end
			end
			
			
			function Dropdown:Toggle()
				if Dropdown.Open then
					Library:tween(Dropdown["2c"], {Size = UDim2.new(1, 0, 0, 32)}, function()
						Dropdown["32"].Visible = false
					end)
				else
					local count = 0
					for i, v in pairs(Dropdown.Items) do
						if v ~= nil then
							count = count + 1
						end
					end
					Dropdown["32"].Visible = true
					if count == 2 then
						Library:tween(Dropdown["2c"], {Size = UDim2.new(1, 0, 0, 30 + (count * 18) - 9)})
					elseif count == 3 then
						Library:tween(Dropdown["2c"], {Size = UDim2.new(1, 0, 0, 30 + (count * 18) - 1)})
					elseif count == 4 then
						Library:tween(Dropdown["2c"], {Size = UDim2.new(1, 0, 0, 30 + (count * 18) + 7)})
					elseif count == 5 then
						Library:tween(Dropdown["2c"], {Size = UDim2.new(1, 0, 0, 30 + (count * 18) + 15)})
					elseif count == 6 then
						Library:tween(Dropdown["2c"], {Size = UDim2.new(1, 0, 0, 30 + (count * 18) + 23)})
					elseif count == 7 then
						Library:tween(Dropdown["2c"], {Size = UDim2.new(1, 0, 0, 30 + (count * 18) + 31)})
					end
				end
				Dropdown.Open = not Dropdown.Open
			end
			
			
			-- Dropdown Logic
			do
				Dropdown["2c"].MouseEnter:Connect(function()
					Dropdown.Hover = true
					Library:tween(Dropdown["2e"], {Color = Color3.fromRGB(55, 55, 134)})
				end)

				Dropdown["2c"].MouseLeave:Connect(function()
					Dropdown.Hover = false
					if not Dropdown.MouseDown then
						Library:tween(Dropdown["2e"], {Color = Color3.fromRGB(27, 27, 66)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true
						Library:tween(Dropdown["2c"], {BackgroundColor3 = Color3.fromRGB(15, 15, 57)})
						Library:tween(Dropdown["2e"], {Color = Color3.fromRGB(55, 55, 134)})
						
						if not Dropdown.HoveringItem then
							Dropdown:Toggle()
						end
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.MouseDown = false
						if Dropdown.Hover then
							Library:tween(Dropdown["2c"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Dropdown["2e"], {Color = Color3.fromRGB(55, 55, 134)})
						else
							Library:tween(Dropdown["2c"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Dropdown["2e"], {Color = Color3.fromRGB(27, 27, 66)})
						end
					end
				end)
			end
			
			
			return Dropdown
		end
		
		function Tab:CreateKeybind(options)
			options = Library:validate({
				title = "Keybind",
				callback = function() end
			}, options or {})
			
			local Key = {
				CurrentEnum = nil,
				CurrentKey = nil,
				Active = false,
				Hover = false,
				MouseDown = false
			}
			
			-- Keybind Render
			do
				-- StarterGui.MyLibrary.Main.Contents.Main.Keybind
				Key["35"] = Instance.new("Frame", Tab["1d"]);
				Key["35"]["BorderSizePixel"] = 0;
				Key["35"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 31);
				Key["35"]["Size"] = UDim2.new(1, 0, 0, 32);
				Key["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["35"]["Name"] = [[Keybind]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Keybind.UICorner
				Key["36"] = Instance.new("UICorner", Key["35"]);
				Key["36"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.MyLibrary.Main.Contents.Main.Keybind.UIStroke
				Key["37"] = Instance.new("UIStroke", Key["35"]);
				Key["37"]["Color"] = Color3.fromRGB(29, 29, 68);


				-- StarterGui.MyLibrary.Main.Contents.Main.Keybind.Title
				Key["38"] = Instance.new("TextLabel", Key["35"]);
				Key["38"]["BorderSizePixel"] = 0;
				Key["38"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Key["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["38"]["TextSize"] = 14;
				Key["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Key["38"]["TextColor3"] = Color3.fromRGB(76, 76, 182);
				Key["38"]["BackgroundTransparency"] = 1;
				Key["38"]["Size"] = UDim2.new(1, -30, 1, 0);
				Key["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["38"]["Text"] = [[Keybind]];
				Key["38"]["Name"] = [[Title]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Keybind.UIPadding
				Key["39"] = Instance.new("UIPadding", Key["35"]);
				Key["39"]["PaddingTop"] = UDim.new(0, 6);
				Key["39"]["PaddingRight"] = UDim.new(0, 6);
				Key["39"]["PaddingLeft"] = UDim.new(0, 6);
				Key["39"]["PaddingBottom"] = UDim.new(0, 6);


				-- StarterGui.MyLibrary.Main.Contents.Main.Keybind.KeyHolder
				Key["3a"] = Instance.new("Frame", Key["35"]);
				Key["3a"]["Active"] = true;
				Key["3a"]["BorderSizePixel"] = 0;
				Key["3a"]["BackgroundColor3"] = Color3.fromRGB(11, 11, 31);
				Key["3a"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Key["3a"]["Size"] = UDim2.new(0, 16, 0, 16);
				Key["3a"]["Position"] = UDim2.new(1, -2, 0.5, 0);
				Key["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["3a"]["Name"] = [[KeyHolder]];


				-- StarterGui.MyLibrary.Main.Contents.Main.Keybind.KeyHolder.UICorner
				Key["3b"] = Instance.new("UICorner", Key["3a"]);
				Key["3b"]["CornerRadius"] = UDim.new(0, 3);


				-- StarterGui.MyLibrary.Main.Contents.Main.Keybind.KeyHolder.UIStroke
				Key["3c"] = Instance.new("UIStroke", Key["3a"]);
				Key["3c"]["Color"] = Color3.fromRGB(29, 29, 68);


				-- StarterGui.MyLibrary.Main.Contents.Main.Keybind.KeyHolder.TextBox
				Key["3d"] = Instance.new("TextBox", Key["3a"]);
				Key["3d"]["CursorPosition"] = -1;
				Key["3d"]["TextColor3"] = Color3.fromRGB(28, 28, 67);
				Key["3d"]["PlaceholderColor3"] = Color3.fromRGB(28, 28, 67);
				Key["3d"]["BorderSizePixel"] = 0;
				Key["3d"]["TextSize"] = 14;
				Key["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Key["3d"]["Size"] = UDim2.new(1, 0, 1, 0);
				Key["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["3d"]["Text"] = [[E]];
				Key["3d"]["BackgroundTransparency"] = 1;
			end
			
			-- Keybind Functions / methods
			function Key:CurrentEnumKeybind(current)
				Key.CurrentEnum = current
			end
			
			function Key:Toggle(b)
				if b == nil then
					Key.Active = not Key.Active
				else
					Key.Active = b
				end
				
				if Key.Active then
					Library:tween(Key["3c"], {Color = Color3.fromRGB(50, 50, 120)})
					Library:tween(Key["3d"], {TextColor3 = Color3.fromRGB(75, 75, 181)})
					
				else
					Library:tween(Key["3c"], {Color = Color3.fromRGB(29, 29, 68)})
					Library:tween(Key["3d"], {TextColor3 = Color3.fromRGB(28, 28, 67)})
				end
			end
			
			-- Keybind Logic
			do
				-- For the effects / toggle
				Key["35"].MouseEnter:Connect(function()
					Key.Hover = true
					Library:tween(Key["37"], {Color = Color3.fromRGB(55, 55, 134)})
				end)

				Key["35"].MouseLeave:Connect(function()
					Key.Hover = false
					if not Key.MouseDown then
						Library:tween(Key["37"], {Color = Color3.fromRGB(28, 28, 67)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Key.Hover then
						Key.MouseDown = true
						Library:tween(Key["35"], {BackgroundColor3 = Color3.fromRGB(15, 15, 57)})
						Library:tween(Key["37"], {Color = Color3.fromRGB(55, 55, 134)})
						Key:Toggle()
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Key.MouseDown = false
						if Key.Hover then
							Library:tween(Key["35"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Key["37"], {Color = Color3.fromRGB(55, 55, 134)})

						else
							Library:tween(Key["35"], {BackgroundColor3 = Color3.fromRGB(10, 10, 30)})
							Library:tween(Key["37"], {Color = Color3.fromRGB(28, 28, 67)})
						end
					end
				end)


				-- For the keybind text / letter
				UIS.InputBegan:Connect(function(key, gpe)
					if gpe then return end
					
					local function GetKeyCode(text)
						return Enum.KeyCode[text]
					end
					
					if key.UserInputType == Enum.UserInputType.Keyboard then
						local Keybind = GetKeyCode(Key["3d"]["Text"])
						if key.KeyCode == Keybind and Key.Active then
							Key:CurrentEnumKeybind(Keybind)
							options.callback(Key.CurrentEnum)
						end
					end
				end)
				
				Key["3d"]:GetPropertyChangedSignal("Text"):Connect(function()
					Key["3d"]["Text"] = string.upper(Key["3d"]["Text"])
					
					if #Key["3d"]["Text"] == 1 and not Key["3d"]["Text"]:match("^%s*$") then
						Key.CurrentKey = Key["3d"]["Text"]
						Key["3d"]:ReleaseFocus()
					end
					
					Key["3d"].FocusLost:Connect(function()
						if Key["3d"]["Text"] == "" or #Key["3d"]["Text"] == 0 then
							Key["3d"]["Text"] = Key.CurrentKey
						elseif Key["3d"]["Text"]:match("^%s*$") then
							Key["3d"]["Text"] = Key.CurrentKey
						end
					end)
				end)
			end
			
			return Key
		end
		
		return Tab
	end
	
	return GUI
end

local Nautilus = Library:new()
return Nautilus
