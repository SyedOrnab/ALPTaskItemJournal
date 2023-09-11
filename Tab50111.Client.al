table 50111 Client
{
    Caption = 'Client';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[10])
        {
            Caption = 'ID';

            trigger OnValidate()
            begin
                if ID <> xRec.ID then begin
                    PurchaseSetup.Get();
                    NoSeriesMgt.TestManual(PurchaseSetup."Requisation Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Request by ID"; Code[20])
        {
            Caption = 'Request by ID';
            TableRelation = Employee;
            trigger OnValidate()
            var
                recEmployeeName: Record Employee;
                recEmployeeDept: Record Employee;
            begin
                recEmployeeName.Get("Request by ID");
                recEmployeeDept.Get("Request by ID");
                "Request by Name" := recEmployeeName.FullName();
                Dept := recEmployeeDept."Global Dimension 1 Code";
            end;
        }
        field(7; "Request by Name"; Text[30])
        {
            Caption = 'Request by Name';
        }
        field(3; Dept; Code[20])
        {
            Caption = 'Dept';
            TableRelation = Employee."Global Dimension 1 Code";
            // OptionMembers = ,IT,SC,M;
            // OptionCaption = ',IT,SC,M';
        }
        field(4; Time; Time)
        {
            Caption = 'Time';
        }
        field(5; Date; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Date1: Date;
            begin
                Date1 := 20180612D;
                Message(Format(Date1));
            end;
        }
        field(6; Status; Code[20])
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            // OptionMembers = ,Pending,Complete;
            // OptionCaption = ', Pending,Complete';
            // trigger OnValidate()
            // // var issquan : Record Items;
            // begin
            //     if (Totalremainquantity = 0)
            //     then
            //     begin
            //         Status := 'No Pending Remaining';
            //     end
            //     else 
            //     begin
            //         Status := 'Pending Remaining';
            //     end;
            // end;
        }
        field(8; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(9; Totalquantity; Integer)
        {
            Caption = 'Totalquantity';
            TableRelation = Items;
            FieldClass = FlowField;
            CalcFormula = sum(Items."Req. Quantity" where("Item ID" = field(ID)));
            // DataClassification = ToBeClassified;
        }
        field(10; Totalremainquantity; Integer)
        {
            Caption = 'Total Remaining Quantity';
            TableRelation = Items;
            FieldClass = FlowField;
            CalcFormula = sum(Items."Remaining quantity" where("Item ID" = field(ID)));
            // DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if ID = '' then begin
            PurchaseSetup.Get();
            PurchaseSetup.TestField("Requisation Nos.");
            NoSeriesMgt.InitSeries(PurchaseSetup."Requisation Nos.", xRec."No. Series", 0D, ID, "No. Series");
        end;
    end;

    var
        issquan: Record Items;
        PurchaseSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}