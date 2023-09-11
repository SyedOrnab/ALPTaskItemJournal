table 50112 Items
{
    Caption = 'Items';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item ID"; Code[10])
        {
            Caption = 'Request ID';
            TableRelation = Client.ID;
            
            //FieldClass = FlowFilter;
            //AutoIncrement = true;

        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
           // FieldClass = FlowFilter;
            trigger OnValidate()
                    var
                    Iname: Record Item;
                    begin
                        Iname.Get("Item No.");
                        "Item Name" := Iname.Description;
                    end;
        }
        field(4; "Item Name"; Text[100])
        {
            Caption = 'Item Name';
            TableRelation = Item.Description;
            //FieldClass = FlowFilter;
        }
        field(5; "Req. Quantity"; Integer)
        {
            Caption = 'Req. Quantity';
        }
        field(6; "Issued Quantity"; Integer)
        {
            Caption = 'Issued Quantity';
        }
        field(7; "Remaining quantity"; Integer)
        {
            Caption = 'Request Remaining quantity';
        }
        field(8; "Item Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Item."No.";
            //DataClassification = ToBeClassified;
        }
        field(9; "Req Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Client.ID;
            //DataClassification = ToBeClassified;
        }
        // field(10; "Date Filter"; Date)
        // {
        //     FieldClass = FlowFilter;
        //     TableRelation = Client.Date;
        //     //DataClassification = ToBeClassified;
        // }
        field(11; "Total Item Quantity"; Integer)
        {
            FieldClass = FlowField;
            //CalcFormula = sum(Client.Totalquantity where(ID = field("Req Filter"),Date = field("Date Filter")));
            CalcFormula = sum(Items."Req. Quantity" where("Item ID" = field("Req Filter"),"Item No."=field("Item Filter")));
            //DataClassification = ToBeClassified;
        }
        // field(8; "Price"; Decimal)
        // {
        //     //DataClassification = ToBeClassified;
        //     Caption = 'Price';
        //     TableRelation = Item."Unit Price";
        //     FieldClass = FlowField;
        //     CalcFormula = sum("Item"."Unit Price" where("No." = field("Item No."), Description = field("Item Name")));
        // }
        field(12; "Posted Doc Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Item ID", "Line No.")
        {
            Clustered = true;

        }
    }
    var
    client: Record Client;
}
