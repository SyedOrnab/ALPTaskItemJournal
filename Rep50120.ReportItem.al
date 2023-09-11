report 50120 ReportItem
{
    ApplicationArea = All;
    Caption = 'ReportItem';
    WordLayout = 'Item List.docx';
    DefaultLayout = Word;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(ItemList; Items)
        {
            column(Item_ID; "Item ID"){}
            column(Item_No; "Item No."){}
            column(Item_Name;"Item Name"){}
            column(Total_Item_Quantity;"Total Item Quantity"){}
        }
    }
    /*requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }*/
}
