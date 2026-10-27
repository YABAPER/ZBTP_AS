CLASS zcl_so_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS: insert_data,
      remove_data.
ENDCLASS.



CLASS zcl_so_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    remove_data( ).
    insert_data( ).
    out->write(
    EXPORTING  data   = 'processing is completed successfully!'
*        name   =
*      RECEIVING
*        output =
    ). ENDMETHOD.

  METHOD remove_data.
    DELETE FROM : zdt_sh,zdt_si.
  ENDMETHOD.

  METHOD insert_data.

    DATA: lt_sh TYPE TABLE OF zdt_sh,
          lt_si TYPE TABLE OF zdt_si.

    "Insert SO header data

    APPEND VALUE #(
    vbeln  = '1000000001'
    erdat  = '20261001'
    audat  = '20261001'
    vbtyp  = 'OR'
    auart  = 'TA'
    vkorg  = '1000'
    netwr  = '15000.00'
    waerk  = 'USD'
     )
    TO lt_sh.

    APPEND VALUE #(
    vbeln  = '1000000002'
    erdat  = '20261002'
    audat  = '20261002'
    vbtyp  = 'RE'
    auart  = 'OR'
    vkorg  = '1000'
    netwr  = '5000.00'
    waerk  = 'EUR'
     )
    TO lt_sh.

    APPEND VALUE #(
    vbeln  = '1000000003'
    erdat  = '20261003'
    audat  = '20261003'
    vbtyp  = 'OR'
    auart  = 'TA'
    vkorg  = '2000'
    netwr  = '12000.00'
    waerk  = 'GBP'
     )
    TO lt_sh.

    APPEND VALUE #(
    vbeln  = '1000000004'
    erdat  = '20261004'
    audat  = '20261004'
    vbtyp  = 'QT'
    auart  = 'TA'
    vkorg  = '3000'
    netwr  = '8000.00'
    waerk  = 'JPY'
     )
    TO lt_sh.

    APPEND VALUE #(
    vbeln  = '1000000005'
    erdat  = '20261005'
    audat  = '20261005'
    vbtyp  = 'OR'
    auart  = 'TA'
    vkorg  = '1000'
    netwr  = '25000.00'
    waerk  = 'CAD'
     )
    TO lt_sh.

    "Insert SO Item data

    APPEND VALUE #(
    vbeln  = '1000000001'
    posnr  = '000010'
    matnr  = 'LAPTOP-15'
    matkl  = 'LAPT'
    meins  = 'PC'
    vrkme  = 'PC'
    ntgew  = '2.50'
    gewei  = 'KG'
    netwr  = '3200.00'
    waerk  = 'USD'
     )
    TO lt_si.

    APPEND VALUE #(
        vbeln   = '1000000002'
        posnr   = '000010'
        matnr   = 'MSE-LOGI-WL'
        matkl   = 'ACCS'
        meins   = 'EA'
        vrkme   = 'EA'
        ntgew   = '0.10'
        gewei   = 'KG'
        netwr   = '50.00'
        waerk  =  'EUR'
        ) TO lt_si.

    APPEND VALUE #(
        vbeln   = '1000000003'
        posnr   = '000010'
        matnr   = 'MON-27UHD'
        matkl   = 'MONI'
        meins   = 'EA'
        vrkme   = 'EA'
        ntgew   = '4.90'
        gewei   = 'KG'
        netwr   = '1350.00'
        waerk   = 'GBP'
        ) TO lt_si.

    APPEND VALUE #(
        vbeln  = '1000000004'
        posnr  = '000010'
        matnr  = 'PRN-HP2025'
        matkl  = 'PRNT'
        meins  = 'EA'
        vrkme  = 'EA'
        ntgew  = '7.60'
        gewei  = 'KG'
        netwr  = '125'
        waerk  = 'JPY'
        ) TO lt_si.

    APPEND VALUE #(
        vbeln  = '1000000005'
        posnr  = '000010'
        matnr  = 'MOB-IP14'
        matkl  = 'MOBL'
        meins  = 'PC'
        vrkme  =  'PC'
        ntgew  = '0.35'
        gewei  = 'KG'
        netwr  = '950.00'
        waerk  = 'CAD'
         ) TO lt_si.

    INSERT zdt_sh FROM TABLE @lt_sh.
    INSERT zdt_si FROM TABLE @lt_si.


  ENDMETHOD.

ENDCLASS.
