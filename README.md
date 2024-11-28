# Random-NordVPN-Mac
Run a random country within the NordVPN Mac App

This AppleScript script allows you to quickly connect to a random country from a predefined list using the NordVPN macOS application. The script is customizable and can be adjusted to include or exclude specific countries based on your preference.

## Prerequisites

Before using this script, ensure the following:

1. **NordVPN Application**:
   - The NordVPN application must be installed and open on your Mac.
   - [Download NordVPN](https://nordvpn.com/download/).

2. **macOS Terminal**:
   - The script is executed via the Terminal application on macOS.

3. **AppleScript Execution**:
   - AppleScript is supported natively on macOS and can be run from the Terminal.

## Script Details

- The list of countries is located in **line 3** of the random_country_vpn.scpt script.
- You can add or remove countries from the list as needed.
- The script will randomly pick one of the listed countries and attempt to connect using NordVPN.

## How to Use

1. **Download the Script**:
   Clone this repository or download the script file:
   ```bash
   git clone https://github.com/nicocouz/Random-NordVPN-Mac.git
   cd nordvpn-country-switcher
   ```

2. **Edit the Country List (Optional)**:
   - Open the script in a text editor.
   - Modify the list on **line 3** to add or remove countries:
     ```applescript
     set countries to {"United States", "United Kingdom", "Germany", "France"}
     ```

3. **Open NordVPN**:
   Ensure the NordVPN application is open and logged in.

4. **Run the Script**:
   Open Terminal and execute the following command:
   ```bash
   osascript random_country_vpn.scpt
   ```
   Replace `random_country_vpn.scpt` with the actual path to the script file.

5. **Watch the Magic**:
   The script will randomly select a country from the list and attempt to connect through NordVPN.

## Customization

- **Add/Remove Countries**:
  Modify the `countries` list in the script to customize which countries NordVPN will connect to.
  
- **Connection Issues**:
  Ensure that the country names in the script match the ones recognized by NordVPN.

## Troubleshooting

- **NordVPN Not Connecting**:
  Ensure the NordVPN app is open and logged in before running the script.
  
- **Script Fails to Run**:
  Verify that AppleScript is enabled and the script file has the correct permissions:
  ```bash
  chmod +x random_country_vpn.scpt
  ```

## Contributing

Feel free to open issues or submit pull requests to improve the script. All contributions are welcome!
