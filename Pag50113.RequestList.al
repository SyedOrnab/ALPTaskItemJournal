page 50113 "Request List"
{
    ApplicationArea = All;
    Caption = 'Request List';
    PageType = List;
    SourceTable = Client;
    UsageCategory = Lists;
    CardPageId = "Request Card";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field("Request by ID"; Rec."Request by ID")
                {
                    ToolTip = 'Specifies the value of the Request by field.';
                }
                field("Request by Name"; Rec."Request by Name")
                {
                    ToolTip = 'Specifies the value of the Request by field.';
                }
                field(Dept; Rec.Dept)
                {
                    ToolTip = 'Specifies the value of the Dept field.';
                }
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    // trigger OnValidate()
                    // begin
                    //     StatusQuan();
                    // end;
                }
                field(Totalquantity;Rec.Totalquantity)
                {
                    Caption = 'Total Quantity';
                    
                }
                field(Totalremainquantity;Rec.Totalremainquantity)
                {
                    Caption = 'Total Remaining Quantity';
                    Visible = false;
                }
            }
        }
    }
    // var
    // issquan : Record Items;
    // client : Record Client;
    // procedure StatusQuan()
    // begin
    //     if (issquan."Remaining quantity" = 0)
    //             then
    //             begin
    //                 client.Status := 'No Pending Remaining';
    //             end
    //             else 
    //             begin
    //                 client.Status := 'Pending Remaining';
    //             end;
    // end;
    procedure RemainQuan()
    var
    rquan : Record Client;
    begin
                if (rquan.Totalremainquantity = 0)
                then
                begin
                    rquan.Status := 'No Pending Remaining';
                end
                else 
                begin
                    rquan.Status := 'Pending Remaining';
                end;
    end;
}
