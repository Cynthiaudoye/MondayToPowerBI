# Monday.com to Power BI Integration Script

This repository hosts a Power Query M script designed to streamline the integration of Monday.com data into Power BI. By enabling live data fetching and preparation, it facilitates more insightful data analysis and visualization within Power BI.

## Prerequisites

Before you start, ensure you have access to Monday.com with permissions to generate an API token. You should also have Power BI Desktop installed on your computer.

## Getting Started

### Step 1: Obtain Your Monday.com API Token
1. Log in to your Monday.com account.
2. Navigate to your profile settings and find the API section to generate your personal API token.

### Step 2: Prepare Power BI
1. Open Power BI Desktop.
2. Go to the "Home" tab and click on "Transform Data" to open Power Query Editor.

### Step 3: Using the Script
1. In this repository, locate the Power Query M script file.
2. Copy the entire script.
3. In Power Query Editor, right-click in the Queries pane and select "New Query" > "Blank Query".
4. In the newly opened query, go to the "Advanced Editor" from the "Home" tab.
5. Paste the copied script into the Advanced Editor window, replacing any existing content.
6. **Important**: Update the script with your Monday.com API token and board id where indicated.
7. Press "Done" to load the query. Power BI will now fetch and transform your Monday.com data based on the script.

### Step 4: Customize (Optional)
- Modify the script to target specific data by adjusting the GraphQL query within the script.
- Customize the data transformation steps as needed to fit your analysis requirements.

## Contributing

Your feedback and contributions are welcome. If you have suggestions for improving this script or have developed enhancements, please share them by opening an issue or pull request.

## Note

This script is provided as-is for facilitating data integration from Monday.com to Power BI. It might require adjustments based on changes to the Monday.com API or Power BI features and also it can be used for your Excel analysis
