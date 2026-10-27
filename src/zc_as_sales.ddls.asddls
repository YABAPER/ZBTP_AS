@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Consumption View'
@Metadata.ignorePropagatedAnnotations: false

@VDM.viewType: #CONSUMPTION 
define view entity ZC_AS_SALES as select from ZI_SALE_ORDERS

{
    
  key OrderID, 
    key ItemID, 
    Erdat, 
    Audat, 
    Vbtyp, 
    Auart, 
    Vkorg, 
    Matnr, 
    Matkl, 
    Meins, 
    Vrkme, 
    Ntgew, 
    Gewei, 
    Netwr, 
    Waerk
    
}
