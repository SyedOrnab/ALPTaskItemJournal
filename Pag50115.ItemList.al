page 50115 "Item Lists"
{
    ApplicationArea = All;
    Caption = 'Item List';
    PageType = ListPart;
    SourceTable = Items;
    UsageCategory = Lists;
    AutoSplitKey = true;


    layout
    {
        area(content)
        {
            repeater(ItemList)
            {
                field(ID; Rec."Item ID")
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
                    trigger OnValidate()
                    begin
                        Rec."Remaining quantity" := Rec."Req. Quantity" - Rec."Issued Quantity";
                        // if Rec."Remaining quantity" > 0
                        // then begin
                        //     Rec.Availibility := 'Available';
                        // end;
                        // if Rec."Remaining quantity" = 0 then 
                        // begin
                        //     Rec.Availibility := 'Not Available';
                        // end;
                        //  GetAvailibility();
                    end;
                }
                field("Remaining quantity"; Rec."Remaining quantity")
                {
                    ToolTip = 'Specifies the value of the Remaining quantity field.';
                    Editable = false;
                }
                field("Item Filter"; Rec."Item Filter")
                {
                    ToolTip = 'Specifies the value of the Remaining quantity field.';
                    Visible = false;
                }
                field("Req Filter"; Rec."Req Filter")
                {
                    ToolTip = 'Specifies the value of the Remaining quantity field.';
                    Visible = false;
                }
                // field("Date Filter"; Rec."Date Filter")
                // {
                //     ToolTip = 'Specifies the value of the Remaining quantity field.';
                //     Visible = false;
                // }
                field("Total Item Quantity"; Rec."Total Item Quantity")
                {
                    ToolTip = 'Specifies the value of the Remaining quantity field.';
                    Visible = false;
                }
                field("Posted Doc Number"; Rec."Posted Doc Number")
                {}

                // field(Price; Rec.Price)
                // {
                //     Editable = false;
                // }
                // field(Availibility; Rec.Availibility)
                // {
                //     ToolTip = 'Specifies the value of the Availibility field.';
                //     Editable = false;
                // }
            }
        }
    }
    var
        Remainingquantity: Integer;
        Availibility: Text[15];

    // procedure GetAvailibility()
    // begin
    //     case Remainingquantity of
    //         0:
    //             begin
    //                 Rec.Availibility := 'Not Available';
    //             end;
    //         1 .. 100:
    //             begin
    //                 Rec.Availibility := 'Available';
    //             end;
    //     end;
    // end;
}
