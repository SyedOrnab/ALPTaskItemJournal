tableextension 50118 RequestItemsExt extends "Purchases & Payables Setup"
{
    fields
    {
        field(50118; "Requisation Nos."; Code[20])
        {
            Caption = 'Requisation Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
