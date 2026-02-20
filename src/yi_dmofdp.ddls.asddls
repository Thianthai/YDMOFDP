@EndUserText.label: 'Demo Form Data Provider'
@ObjectModel.query.implementedBy:'ABAP:YCL_DMOFDP'
@ObjectModel.supportedCapabilities: [ #OUTPUT_FORM_DATA_PROVIDER ]
define root custom entity YI_DMOFDP
{
      @UI.lineItem      : [{ position: 50 }]
      @EndUserText.label: 'Company Code'
      @UI.selectionField: [{ position: 10 }]
      @Consumption.filter.mandatory: true
      @Consumption.valueHelpDefinition: [ {
          entity        : { name: 'I_CompanyCodeVH', element: 'CompanyCode' }
        } ]
  key CompanyCode       : bukrs;
      @UI.lineItem      : [{ position: 30 }]
      @EndUserText.label: 'Journal Entry'
      @UI.selectionField: [{ position: 30 }]
  key JournalEntry      : belnr_d;
      @UI.lineItem      : [{ position: 10 }]
      @EndUserText.label: 'Fiscal Year'
      @UI.selectionField: [{ position: 60 }]
  key FiscalYear        : gjahr;

      @UI.selectionField: [{ position: 70 }]
      @EndUserText.label: 'Posting Date'
      @UI.lineItem      : [{ position: 70 }]
      @Consumption.filter.selectionType: #INTERVAL
      PostingDate       : budat;
      @Semantics.mimeType:true
      FileName          : abap.char( 50 );
      MimeType          : abap.char( 50 );
      @Semantics.largeObject:{
        mimeType        : 'MimeType',
        fileName        : 'FileName',
        contentDispositionPreference: #ATTACHMENT
      }
      @UI.lineItem      : [ { position: 990, label: 'Download File' } ]
      Attachment        : abap.rawstring( 0 );
      @UI.lineItem      : [
        { position      : 999, label: 'Print Journal Entry', type: #FOR_ACTION,
          dataAction    : 'PrintJournal', inline: false }
      ]
      PrintJournalBTN   : abap.char(1);
      
      _item             : composition of exact one to many YI_DMOFDP_ITEM;
}
