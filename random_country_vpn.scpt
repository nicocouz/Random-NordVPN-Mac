on run
	-- Define the list of countries we are interested in
	set countryList to {"Spain", "France"}

	-- Pick a random country from the list
	set randomIndex to (random number from 1 to (count of countryList))
	set selectedCountry to item randomIndex of countryList
	log "Selected country: " & selectedCountry

	set startTime to current date

	tell application "NordVPN" to activate
	delay 0.5

	tell application "System Events"
		tell process "NordVPN"
			set frontmost to true
			delay 0.5

			-- Reference to the sidebar panel containing the search and server list
			set sidePanel to group 1 of group 2 of group 1 of window 1
			set searchField to text field 1 of sidePanel

			-- Clear the search field and type the country name
			click searchField
			delay 0.2

			-- Select all existing text and replace with country name
			keystroke "a" using command down
			keystroke selectedCountry
			delay 0.8 -- Wait for the search results to filter

			-- Now the table should show only matching results
			set theTable to table 1 of scroll area 1 of sidePanel
			set rowCount to count of rows of theTable
			log "Search results: " & rowCount & " rows"

			-- Collect matching country rows from filtered results
			set availableServers to {}
			repeat with i from 1 to rowCount
				try
					set serverName to value of static text 1 of button 1 of UI element 1 of row i of theTable
					if serverName contains selectedCountry then
						set end of availableServers to {serverName, i}
						log "  Found: " & serverName & " (row " & i & ")"
					end if
				on error
					-- Skip non-country rows (headers, etc.)
				end try
			end repeat

			if (count of availableServers) is greater than 0 then
				-- Pick a random match (in case multiple cities for one country)
				set randomServer to some item of availableServers
				set selectedServerName to item 1 of randomServer
				set selectedRow to item 2 of randomServer

				log "Connecting to: " & selectedServerName & " (row " & selectedRow & ")"
				click button 1 of UI element 1 of row selectedRow of theTable
			else
				log "No server found for " & selectedCountry & " in search results"
			end if

			-- Clear the search field to restore full list
			delay 0.3
			click searchField
			keystroke "a" using command down
			key code 51 -- Delete key
			delay 0.2

			set endTime to current date
			log "Total time: " & ((endTime - startTime)) & " seconds"
		end tell
	end tell
end run
