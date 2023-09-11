page 50114 "Request Card"
{
    ApplicationArea = All;
    Caption = 'Request';
    PageType = Card;
    UsageCategory = Documents;
    SourceTable = Client;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
                    Editable = false;
                }
                field(Totalquantity; Rec.Totalquantity)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group(Line)
            {
                part(ItemList; "Item Lists")
                {
                    SubPageLink = "Item ID" = field(ID);
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Image = PostOrder;
                ShortCutKey = 'F9';

                trigger OnAction()
                var
                    ItemJournalLineRec: Record "Item Journal Line";
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                    ItemRec: Record Items;
                    Client: Record Client;
                    ItemListSubPage: Page "Item List Page";
                    DocNum: Code[20];
                    TempName: Code[10];
                    Line: Integer;
                    lastRec: Record Items;

                begin
                    Line := 0;
                    ItemJournalLineRec.FindLast();
                    Line := ItemJournalLineRec."Line No.";

                    DocNum := NoSeriesMgt.TryGetNextNo('IJNL-GEN', Today());
                    ItemRec.SetRange("Item ID", Rec.ID);
                    if ItemRec.FindFirst() then begin
                        repeat
                            TempName := 'ITEM';

                            ItemJournalLineRec.Init();
                            ItemJournalLineRec."Journal Template Name" := TempName;
                            ItemJournalLineRec."Journal Batch Name" := 'DEFAULT';
                            ItemJournalLineRec."Line No." := Line + 1000;
                            ItemJournalLineRec."Document No." := DocNum;
                            ItemJournalLineRec."Posting Date" := Today();
                            ItemJournalLineRec.Validate("Item No.", ItemRec."Item No.");
                            ItemJournalLineRec.Quantity := ItemRec."Issued Quantity";

                            ItemJournalLineRec.Insert(true);
                            Line += 1;
                            ItemRec."Posted Doc Number" := DocNum;
                            ItemRec.Modify();
                        until ItemRec.Next() = 0;
                    end;

                end;
            }
        }
    }
    var
        ItemJour: Record "Item Journal Line";
        Item: Record Items;
}
