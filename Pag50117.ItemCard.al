page 50117 "Item Cards"
{
    ApplicationArea = All;
    Caption = 'Item Card';
    PageType = Card;
    SourceTable = Items;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Item ID"; Rec."Item ID")
                {
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Item Name"; Rec."Item Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field.';
                }
                field("Req. Quantity"; Rec."Req. Quantity")
                {
                    ToolTip = 'Specifies the value of the Req. Quantity field.';
                }
                field("Issued Quantity"; Rec."Issued Quantity")
                {
                    ToolTip = 'Specifies the value of the Issued Quantity field.';
                }
                field("Remaining quantity"; Rec."Remaining quantity")
                {
                    ToolTip = 'Specifies the value of the Remaining quantity field.';
                }
                // field(Price; Rec."Price")
                // {
                // }
                // field(Availibility; Rec.Availibility)
                // {
                //     ToolTip = 'Specifies the value of the Availibility field.';
                // }
            }
        }
    }
}
