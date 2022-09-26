SELECT TO_CHAR(FV.DTAOPERACAO, 'MM') MES, TO_CHAR(FV.DTAOPERACAO, 'YYYY') ANO,
             
             SUM(FV.QTDOPERACAO) VENDA_QTD,

             SUM(FV.VVLROPERACAOBRUTO) VENDA_VLR_BRUTO,
             SUM(FV.VLROPERACAO)               VENDA_VLR_LIQUIDO,

             ROUND(SUM( FV.vlroperacao - FV.vvlrctoliquido - FV.vvlrimpostosaida - nvl( FV.vlrdespoperacionalitem, 0 ) - FV.vlrcomissao- FV.vlrverbacompra - FV.vlrcalcimpostovda ),2) VENDA_VLR_LUCRO,
             ROUND((SUM( FV.vlroperacao - FV.vvlrctoliquido - FV.vvlrimpostosaida - nvl( FV.vlrdespoperacionalitem, 0 ) - FV.vlrcomissao- FV.vlrverbacompra - FV.vlrcalcimpostovda ) / SUM(FV.VLROPERACAO)*100),2) "VENDA_MARGEM",

              SUM(FV.CONTDOCTO) VENDA_QTD_CUPOM

             /* CASE WHEN FV.VLRPROMOC >0 THEN 'SIM' ELSE 'NÃO' END VENDA_PROMOCAO,
              DECODE(FV.NROSEGMENTO, '1','CD-GRU','2','NAGUMO-SP','3','RIO DE JANEIRO','4','MIXTER-ATACAREJO','5','E-COMMERCE') VENDA_SEGMENTO,

              0 AS VENDA_TIPO_OFERTA,
              DECODE(FV.NROSEGMENTO,5,'E-COMMERCE','LOJA') VENDAS_CANAL*/

FROM FATOG_VENDADIA FV
WHERE FV.CODGERALOPER IN (37,48,123,610,615,613,810,916,910,911)
AND FV.DTAOPERACAO >= '01-JAN-2021'
GROUP BY TO_CHAR(FV.DTAOPERACAO, 'MM'), TO_CHAR(FV.DTAOPERACAO, 'YYYY')
