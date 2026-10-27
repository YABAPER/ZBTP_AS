@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Composite view'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE
define view entity ZI_SALE_ORDERS as select from ZI_SH_DATA as so_data

{
    key vbeln as OrderID, 
    key so_data._item.posnr as ItemID,
    Erdat, 
    Audat, 
    Vbtyp, 
    Auart, 
    Vkorg, 
    so_data._item.matnr as Matnr, 
    so_data._item.matkl as Matkl, 
    so_data._item.meins as Meins, 
    so_data._item.vrkme as Vrkme, 
    @DefaultAggregation: #SUM 
    @Semantics.quantity.unitOfMeasure: 'Gewei' 
    so_data._item.ntgew as Ntgew, 
    so_data._item.gewei as Gewei, 
    @DefaultAggregation: #SUM 
    @Semantics.amount.currencyCode: 'Waerk' 
    so_data._item.netwr as Netwr, 
    so_data._item.waerk as Waerk
    
    
}
