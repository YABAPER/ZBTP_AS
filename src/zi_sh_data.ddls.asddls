@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Data'
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #BASIC
define view entity ZI_SH_DATA as select from zdt_sh as hdr
association[1..*] to zdt_si as _item on
$projection.vbeln = _item.vbeln

{
  key vbeln as vbeln,
      erdat as Erdat,
      audat as Audat,
      vbtyp as Vbtyp,
      auart as Auart,
      vkorg as Vkorg,
      _item    
  
    
}
