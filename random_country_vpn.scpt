on run
	-- Define the list of countries we are interested in
	set countryList to {"France", "Switzerland", "Belgium", "Monaco", "Luxembourg"}
	set availableServers to {} -- Initialize an empty list to hold servers from desired countries
	
	tell application "NordVPN" to activate
	delay 0.5 -- Slightly increased delay for better UI responsiveness
	
	tell application "System Events"
		tell process "NordVPN"
			set frontmost to true
			delay 0.5 -- Allow UI elements to settle
			
			-- Get the number of rows in the table
			set rowCount to count of rows of table 1 of scroll area 1 of splitter group 1 of window 1
			
			-- Iterate over each row to retrieve server names
			repeat with i from 1 to rowCount
				try
					-- Get the server name in the current row
					set serverName to value of static text of UI element 1 of UI element 1 of row i of table 1 of scroll area 1 of splitter group 1 of window 1
					
					-- Check if the server name contains any of the countries in our list
					repeat with country in countryList
						if serverName contains country then
							-- Add the server to the list of available servers
							set end of availableServers to {serverName, i}
						end if
					end repeat
				on error
					-- Continue if there is an error retrieving the server name
				end try
			end repeat
			
			-- Check if we found any servers
			if (count of availableServers) is greater than 0 then
				-- Randomly select one server from the available list
				set randomServer to some item of availableServers
				set selectedServerName to item 1 of randomServer
				set selectedRow to item 2 of randomServer
				
				-- Click the button for the randomly selected server
				click button 1 of UI element 1 of UI element 1 of row selectedRow of table 1 of scroll area 1 of splitter group 1 of window 1
				
				-- Log the selected server to stdout
				log "Connected to: " & selectedServerName
			else
				-- Log if no servers found
				log "No servers available for the specified countries."
			end if
		end tell
	end tell
end run
