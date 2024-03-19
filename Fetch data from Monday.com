# -*- coding: utf-8 -*-
"""
Created on Tue Mar 19 18:47:30 2024

@author: blank
"""

let
    // Fetch data from the Monday.com API
    Source = Web.Contents("https://api.monday.com/v2",
        [
            Headers = [
                #"Method"="POST",
                #"Content-Type"="application/json",
                // Important: Replace "YourMondayAPITokenHere" with your actual Monday.com API token in a secure manner
                #"Authorization"="Bearer YourMondayAPITokenHere"
            ],
            // This query retrieves data from a specific board. Modify the board ID and query as needed.
            Content = Text.ToBinary("{""query"": ""{ boards (ids: 123456789) { items { id name column_values { title text } } } }""}")
        ]
    ),
    // Parse the JSON response from the Monday.com API
    JsonResponse = Json.Document(Source, 65001),
    // Extract data from the JSON response
    data = JsonResponse[data],
    boards = data[boards],
    boards1 = boards{0},
    items = boards1[items],
    // Convert the retrieved items to a table
    ConvertedToTable = Table.FromList(items, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    // Expand the columns to make the data more accessible
    ExpandedColumn1 = Table.ExpandRecordColumn(ConvertedToTable, "Column1", {"id", "name", "column_values"}, {"ID", "Name", "Column_Values"}),
    
    // Expand column_values into separate columns
    ExpandedColumnValues = Table.ExpandListColumn(ExpandedColumn1, "Column_Values"),
    ExpandedColumnValues2 = Table.ExpandRecordColumn(ExpandedColumnValues, "Column_Values", {"title", "text"}, {"Title", "Text"}),
    
    // Pivot the column_values to create individual columns for each title
    PivotedColumns = Table.Pivot(ExpandedColumnValues2, List.Distinct(ExpandedColumnValues2[Title]), "Title", "Text"),

    // Placeholder for additional data transformation steps as needed...
    // Customize these steps based on the specific data you're working with and your end goals.
    // Ensure no personal or sensitive information is exposed in your shared code.

    // Final step in your data processing
    FinalStep = PivotedColumns
in
    FinalStep
