pageextension 50119 RequestItemsExtP extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Vendor Nos.")
        {
            field("Item Nos."; Rec."Requisation Nos.")
            {
                Caption = 'Requisation Nos.';
                ApplicationArea = All;
            }
        }
    }
}
