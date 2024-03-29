


USE [Agrocomercio]
GO
/****** Object:  User [agrocomercio]    Script Date: 03/23/2013 09:10:37 ******/
CREATE USER [agrocomercio] FOR LOGIN [agrocomercio] WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
/****** Object:  Table [dbo].[TipoPersonal]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoPersonal](
	[tpeCod] [int] NOT NULL,
	[tpeDescripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TipoPersonal] PRIMARY KEY CLUSTERED 
(
	[tpeCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal](
	[perCod] [int] NOT NULL,
	[tpecod] [int] NOT NULL,
	[perNombres] [varchar](50) NULL,
	[perApellidoPat] [varchar](70) NULL,
	[perApellidoMat] [varchar](70) NULL,
	[perDireccion] [varchar](80) NULL,
	[perTelefono] [varchar](15) NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[perCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[CliCod] [int] NOT NULL,
	[CodAnt] [varchar](10) NULL,
	[CliTipoPer] [nchar](1) NULL,
	[CliTipoDoc] [nchar](3) NULL,
	[CliNumDoc] [nvarchar](12) NULL,
	[CliNombre] [nvarchar](80) NULL,
	[CliDireccion] [nvarchar](150) NULL,
	[CliTelefono] [nvarchar](18) NULL,
	[CliRepresen] [nvarchar](50) NULL,
	[CliFecRegis] [datetime] NULL,
	[CliEstado] [bit] NOT NULL,
	[CliCreAsig] [numeric](18, 2) NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[CliCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedores](
	[PrvCod] [int] NOT NULL,
	[CodAnt] [varchar](10) NULL,
	[PrvNumDoc] [nchar](12) NULL,
	[PrvRazon] [nvarchar](80) NOT NULL,
	[PrvDireccion] [nvarchar](150) NULL,
	[PrvTelefono] [nvarchar](18) NULL,
	[PrvContacto] [nvarchar](50) NULL,
	[PrvFecRegis] [date] NOT NULL,
	[PrvEstado] [bit] NOT NULL,
	[PrvDscto] [numeric](18, 3) NULL,
	[PrvGanancia] [numeric](18, 3) NULL,
 CONSTRAINT [PK_PROVEEDORES] PRIMARY KEY CLUSTERED 
(
	[PrvCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[det_letra]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[det_letra](
	[icodletra] [int] NOT NULL,
	[inumletra] [int] NOT NULL,
	[ccodletra] [varchar](10) NULL,
	[nmonto] [numeric](10, 2) NULL,
	[cestado] [varchar](1) NULL,
	[ninteres] [numeric](10, 2) NULL,
	[dfecvenc] [datetime] NULL,
	[dfecpago] [datetime] NULL,
	[dfecmod] [datetime] NULL,
	[idetletra] [int] NOT NULL,
	[cnumletra] [varchar](20) NULL,
 CONSTRAINT [det_letra_pk] PRIMARY KEY CLUSTERED 
(
	[idetletra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-pendiente de pago
2-pagado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'det_letra', @level2type=N'COLUMN',@level2name=N'cestado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'fecha de modificacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'det_letra', @level2type=N'COLUMN',@level2name=N'dfecmod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pk del detalle' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'det_letra', @level2type=N'COLUMN',@level2name=N'idetletra'
GO
/****** Object:  Table [dbo].[DocumenOperacion]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumenOperacion](
	[dopCod] [bigint] NOT NULL,
	[dopNroSerie] [varchar](3) NULL,
	[dopNumero] [varchar](50) NULL,
	[OpeCod] [bigint] NOT NULL,
	[tdoCod] [int] NOT NULL,
	[dopMoneda] [char](3) NULL,
	[dopFecEmision] [smalldatetime] NULL,
	[dopFecCancela] [smalldatetime] NULL,
	[dopNroImpre] [int] NULL,
	[dopFecUltImpre] [smalldatetime] NULL,
	[dopEstado] [char](3) NULL,
	[icodletra] [int] NULL,
 CONSTRAINT [PK_DocumenOperacion] PRIMARY KEY CLUSTERED 
(
	[dopCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo Unico de Documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'dopCod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nro de Serie del Documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'dopNroSerie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nro de Documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'dopNumero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de Operacion Relacionada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'OpeCod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de Documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'tdoCod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Moneda del Documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'dopMoneda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Emision' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'dopFecEmision'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Cancelacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'dopFecCancela'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del Documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'dopEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK de la tabla letra solo tendrar lleno este campo los domuentos FATURA tdoCod= 10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumenOperacion', @level2type=N'COLUMN',@level2name=N'icodletra'
GO
/****** Object:  Table [dbo].[Atributos]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atributos](
	[AtrTipoCod] [int] NOT NULL,
	[AtrNivel] [int] NULL,
	[AtrCodigo] [varchar](3) NOT NULL,
	[AtrDescripcion] [varchar](100) NULL,
	[AtrEstado] [bit] NULL,
 CONSTRAINT [PK_Atributos] PRIMARY KEY CLUSTERED 
(
	[AtrTipoCod] ASC,
	[AtrCodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoCambios]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoCambios](
	[tcmCod] [int] NOT NULL,
	[tcmMoneda] [varchar](4) NULL,
	[tcmCambio] [numeric](12, 2) NULL,
	[tcmFecha] [date] NULL,
	[tcmfecmod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[tcmCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=soles   2=dolares  3=...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoCambios', @level2type=N'COLUMN',@level2name=N'tcmMoneda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'numeric (12,2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoCambios', @level2type=N'COLUMN',@level2name=N'tcmCambio'
GO
/****** Object:  Table [dbo].[Transportistas]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transportistas](
	[TraCod] [int] NOT NULL,
	[TraRuc] [varchar](12) NOT NULL,
	[TraRazonSocial] [varchar](80) NOT NULL,
	[TraDireccion] [varchar](100) NULL,
	[TraTelefono] [varchar](15) NULL,
	[TraFecRegis] [date] NULL,
	[TraEstado] [bit] NULL,
 CONSTRAINT [PK_Transportistas] PRIMARY KEY CLUSTERED 
(
	[TraCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Operaciones]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Operaciones](
	[OpeCod] [bigint] NOT NULL,
	[OpeTipo] [char](1) NULL,
	[OpeFecEmision] [date] NULL,
	[OpeFecCancela] [date] NULL,
	[ZonCod] [int] NULL,
	[PerCod] [int] NULL,
	[TraCod] [int] NULL,
	[CliCod] [int] NULL,
	[PrvCod] [int] NULL,
	[OpeMoneda] [char](3) NULL,
	[OpeTipPago] [varchar](3) NULL,
	[OpeSubTotal] [numeric](18, 2) NULL,
	[OpeDscto] [numeric](18, 2) NULL,
	[OpeFlete] [numeric](18, 2) NULL,
	[OpeImpuesto] [numeric](18, 2) NULL,
	[OpeTotal] [numeric](18, 2) NULL,
	[OpeEstado] [char](1) NULL,
	[OpeModifica] [smalldatetime] NULL,
	[UsrCod] [int] NULL,
	[OpeTotPagPen] [numeric](18, 2) NULL,
	[OpeTotPagar] [numeric](18, 2) NULL,
	[nporDesc] [numeric](12, 2) NULL,
	[tcmCod] [int] NULL,
 CONSTRAINT [PK_Operaciones] PRIMARY KEY CLUSTERED 
(
	[OpeCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo Unico de Operacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeCod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de Operacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeTipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Emision del Operacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeFecEmision'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Cancelación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeFecCancela'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de Zona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'ZonCod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de Vendedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'PerCod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de Tranportista' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'TraCod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Moneda de Operacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeMoneda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de Pago' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeTipPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sub Total de Operacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeSubTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descuento de Operacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeDscto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto de Impuesto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeImpuesto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto Total de Operacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de Operacion (A=abierta,C=Cancelada,N=Anulada)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Modificacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'OpeModifica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de Usuario que Registra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'UsrCod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'porcentaje de descuento al momento de que sea compra al credito y tenga una nota enlaza' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Operaciones', @level2type=N'COLUMN',@level2name=N'nporDesc'
GO
/****** Object:  Table [dbo].[Pag_letras]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pag_letras](
	[idpagletra] [int] NOT NULL,
	[idetletra] [int] NULL,
	[nmonto] [numeric](8, 2) NULL,
	[dfecpago] [date] NULL,
	[dfecmodifi] [datetime] NULL,
	[ipercod] [int] NULL,
	[icodpago] [int] NULL,
	[inumRecibo] [char](20) NULL,
	[cobservaciones] [varchar](100) NULL,
	[ctipPag] [varchar](1) NULL,
	[inumliq] [int] NULL,
 CONSTRAINT [PK__Pag_letr__912CECB666603565] PRIMARY KEY CLUSTERED 
(
	[idpagletra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'enlace a la tabla det_letra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pag_letras', @level2type=N'COLUMN',@level2name=N'idetletra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'monto de pago' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pag_letras', @level2type=N'COLUMN',@level2name=N'nmonto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'fecha de pago' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pag_letras', @level2type=N'COLUMN',@level2name=N'dfecpago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'fecha de modificacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pag_letras', @level2type=N'COLUMN',@level2name=N'dfecmodifi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'codigo del trabajor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pag_letras', @level2type=N'COLUMN',@level2name=N'ipercod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'codigo q se le hace al pago acum' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pag_letras', @level2type=N'COLUMN',@level2name=N'icodpago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de Recibo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pag_letras', @level2type=N'COLUMN',@level2name=N'inumRecibo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'observaciones del recibo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pag_letras', @level2type=N'COLUMN',@level2name=N'cobservaciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C: Cheque
E: Efectivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pag_letras', @level2type=N'COLUMN',@level2name=N'ctipPag'
GO
/****** Object:  Table [dbo].[letra]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[letra](
	[icodigo] [int] NOT NULL,
	[itotcuota] [int] NULL,
	[nmontocuota] [numeric](10, 2) NULL,
	[cmoneda] [varchar](3) NULL,
	[nintpag] [numeric](10, 2) NULL,
	[iestado] [varchar](1) NULL,
	[dfeccreacion] [datetime] NULL,
	[dfecultpago] [datetime] NULL,
	[dfecmod] [datetime] NULL,
	[iusrCreacion] [int] NULL,
	[ctippago] [varchar](1) NULL,
	[nmntnota] [numeric](12, 2) NULL,
 CONSTRAINT [PK__letra__8001D0804316F928] PRIMARY KEY CLUSTERED 
(
	[icodigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'numero total de cuotas de la letra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra', @level2type=N'COLUMN',@level2name=N'itotcuota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'monto total de la letra a cancelar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra', @level2type=N'COLUMN',@level2name=N'nmontocuota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'interes total pagado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra', @level2type=N'COLUMN',@level2name=N'nintpag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'estado de la letra 1 pendiente 2 parcialmente pagado 3 cancelado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra', @level2type=N'COLUMN',@level2name=N'iestado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'fecha de creacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra', @level2type=N'COLUMN',@level2name=N'dfeccreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'fecha de ultimo pago' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra', @level2type=N'COLUMN',@level2name=N'dfecultpago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'fecha de modificacion  getdate()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra', @level2type=N'COLUMN',@level2name=N'dfecmod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'usuario creacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra', @level2type=N'COLUMN',@level2name=N'iusrCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'determina si es letra o es for fecha ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra', @level2type=N'COLUMN',@level2name=N'ctippago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'cabecera de las letras de pago de las compras' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'letra'
GO
/****** Object:  View [dbo].[Pag_pendientes]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Pag_pendientes] (
icodletra,ult, inumletra, dfecEmi, dfecvenc, diaatr,
idetletra, cod_vendedor, vendedor, 
DeudTot, pagTotAcum, mntCuot, 
pagoCuot, cod_cliente, cliente, 
ctippago, OpeTipo, cmoneda
)
AS SELECT DISTINCT DL.icodletra, 
(case when DL.inumletra =(SELECT     MAX(inumletra) AS Expr1
                              FROM         dbo.det_letra
                              WHERE     (icodletra = DL.icodletra)) then 0 else 1 end)as ult
, CAST(DL.inumletra AS VARCHAR(10)) + ' de ' + CAST
                          ((SELECT     MAX(inumletra) AS Expr1
                              FROM         dbo.det_letra
                              WHERE     (icodletra = DL.icodletra)) AS VARCHAR(10)) AS inumletra, 
                              cast (op.opefecemision as date ) AS dfecEmi,
                              CAST (MIN(DL.dfecvenc)as date) AS dfecvenc, 
                              Datediff(DAY,  Min(DL.dfecvenc),getdate()) as diaatr,
                              DL.idetletra,
                              
                          (SELECT    distinct op.PerCod
                            FROM          dbo.DocumenOperacion AS do INNER JOIN
                                                   dbo.Operaciones AS op ON do.OpeCod = op.OpeCod INNER JOIN
                                                   dbo.Personal AS pr ON op.PerCod = pr.perCod
                            WHERE      (do.icodletra = DL.icodletra)) AS cod_vendedor,
                            
                          (SELECT   distinct  pr.perNombres + ' ' + pr.perApellidoPat + ' ' + pr.perApellidoMat AS Expr1
                            FROM          dbo.DocumenOperacion AS do INNER JOIN
                                                   dbo.Operaciones AS op ON do.OpeCod = op.OpeCod INNER JOIN
                                                   dbo.Personal AS pr ON op.PerCod = pr.perCod
                            WHERE      (do.icodletra = DL.icodletra)) AS vendedor,
                          (SELECT     SUM(nmonto) AS Expr1
                            FROM          dbo.det_letra AS ddl
                            WHERE      (icodletra = DL.icodletra)) AS DeudTot, COALESCE
                          ((SELECT     SUM(nmonto) AS Expr1
                              FROM         dbo.Pag_letras
                              WHERE     (idetletra = DL.idetletra)), 0) + COALESCE
                          ((SELECT     SUM(nmonto) AS Expr1
                              FROM         dbo.det_letra AS ddl
                              WHERE     (icodletra = DL.icodletra) AND (cestado = '2')), 0) AS pagTotAcum, DL.nmonto AS mntCuot, COALESCE
                          ((SELECT     SUM(nmonto) AS Expr1
                              FROM         dbo.Pag_letras
                              WHERE     (idetletra = DL.idetletra)), 0) AS pagoCuot, CASE WHEN OpeTipo = 'C' THEN (OP.PrvCod) ELSE (OP.CliCod) END AS cod_cliente,
                              
                          (SELECT   DISTINCT  CASE WHEN OpeTipo = 'C' THEN
                                                       (SELECT     PrvRazon
                                                         FROM          Proveedores
                                                         WHERE      PrvCod = OP.PrvCod) ELSE
                                                       (SELECT     CliNombre
                                                         FROM          Clientes
                                                         WHERE      CliCod = OP.CliCod) END AS PrvRazon
                            FROM          dbo.DocumenOperacion AS do INNER JOIN
                                                   dbo.Operaciones AS op ON do.OpeCod = op.OpeCod
                            WHERE      (do.icodletra = DL.icodletra)) AS cliente, 
                            
                            lt.ctippago, op.OpeTipo, lt.cmoneda

FROM         dbo.det_letra AS DL INNER JOIN
                      dbo.letra AS lt ON DL.icodletra = lt.icodigo INNER JOIN
                      dbo.DocumenOperacion AS do ON lt.icodigo = do.icodletra INNER JOIN
                      dbo.Operaciones AS op ON do.OpeCod = op.OpeCod
WHERE     (DL.cestado = '1')
GROUP BY op.opefecemision ,cmoneda, DL.icodletra, DL.inumletra, DL.idetletra, DL.nmonto, lt.ctippago, op.OpeTipo, op.PrvCod, op.CliCod
GO
/****** Object:  View [dbo].[pag_pendnow]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[pag_pendnow] (
icodletra,ult, inumletra, dfecEmi, dfecvenc, diaatr,
idetletra, cod_vendedor, vendedor, 
DeudTot, pagTotAcum, mntCuot, 
pagoCuot, cod_cliente, cliente, 
ctippago, OpeTipo, cmoneda
)
AS
 select * from Pag_pendientes pan where idetletra= (
select MIN(idetletra) from Pag_pendientes where icodletra = pan.icodletra )
GO
/****** Object:  View [dbo].[detalle_pagos]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery9.sql|0|0|C:\Users\Administrador\AppData\Local\Temp\~vsE30A.sql
CREATE view [dbo].[detalle_pagos] (
vendedor,ccodletra, cnumletra, cnumcuota, 
CliNombre, OpeFecEmision, dfecvenc, 
dfecpago, diaatr, cmoneda, 
total, saldo, 
PAG_TOTAL, mnt_cuota, saldo_cuota,
 pag_cuota, ninteres, traCod, OpeTipo, 
 cestado, idetletra, icodletra, 
 inumletra, cli_cod,ult)
as

SELECT 
(select pernombres from Personal where perCod= Op.percod) as vendedor,
dl.[ccodletra],
[cnumletra],
 CAST(DL.inumletra AS VARCHAR(10)) + ' de ' + CAST
((SELECT     MAX(inumletra) AS Expr1
FROM         dbo.det_letra
WHERE     (icodletra = DL.icodletra)) AS VARCHAR(10)) AS cnumcuota,  
 case when OpeTipo='V' then (select clinombre from clientes where CliCod= op.CliCod)
 else (select PrvRazon from Proveedores where PrvCod = OP.prvcod)  end as CliNombre,
 cast (Op.OpeFecEmision as DATE ) as OpeFecEmision ,
 cast ( DL.dfecvenc as DATE) as dfecvenc ,
 cast ( DL.dfecpago  as DATE) as dfecpago ,
 case when DL.cestado=2 then Datediff(DAY,  DL.dfecvenc ,DL.dfecpago ) else 
Datediff(DAY,  DL.dfecvenc ,getdate()) end as diaatr,
cmoneda,
op.OpeTotPagar as total,
op.OpeTotPagPen as saldo, 
(select SUM(nmonto) from Pag_letras where idetletra in (select idetletra from det_letra where icodletra = DL.icodletra)) AS PAG_TOTAL, 
[nmonto] as mnt_cuota,
coalesce (case when ([nmonto]- (select SUM(nmonto) from Pag_letras where idetletra =DL.[idetletra]))<0 then 0
else ([nmonto]- (select coalesce (SUM(nmonto) ,0)from Pag_letras where idetletra =DL.[idetletra]))end
 ,0)as saldo_cuota,
coalesce ((select SUM(nmonto) from Pag_letras where idetletra =DL.[idetletra]),0) as pag_cuota,
[ninteres],
op.PerCod,
	  OpeTipo,
	 [cestado],	  
      [idetletra],      
      DL.icodletra,
      inumletra,
      case when OpeTipo='V' then (op.CliCod)
 else ( OP.prvcod)  end as CliCod,
      (case when DL.inumletra =(SELECT     MAX(inumletra) AS Expr1
FROM         dbo.det_letra
WHERE     (icodletra = DL.icodletra)) then 0 else 1 end)as ult

  FROM [Agrocomercio].[dbo].[det_letra] DL
  inner join letra LT on DL.icodletra = LT.icodigo
 inner join dbo.DocumenOperacion AS do ON lt.icodigo = do.icodletra 
INNER JOIN dbo.Operaciones AS op ON do.OpeCod = op.OpeCod
GO
/****** Object:  View [dbo].[detalle_pagos_now]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script para el comando SelectTopNRows de SSMS  ******/
CREATE view [dbo].[detalle_pagos_now](
vendedor,ccodletra, cnumletra, cnumcuota, 
CliNombre, OpeFecEmision, dfecvenc, 
dfecpago, diaatr, cmoneda, 
total, saldo, 
PAG_TOTAL, mnt_cuota, saldo_cuota,
 pag_cuota, ninteres, traCod, OpeTipo, 
 cestado, idetletra, icodletra, 
 inumletra, cli_cod,ult)
 as 
 
select vendedor,ccodletra, cnumletra, cnumcuota, 
CliNombre, Max(OpeFecEmision), dfecvenc, dfecpago, diaatr, cmoneda, 
sum(total), sum(saldo), PAG_TOTAL, mnt_cuota, saldo_cuota,
 pag_cuota, ninteres, traCod, OpeTipo, 
 cestado, idetletra, icodletra, 
 inumletra, cli_cod,ult
  from detalle_pagos pan
where idetletra= (
select MIN(idetletra) from detalle_pagos where icodletra = pan.icodletra and cestado=1 )

group by vendedor,ccodletra, cnumletra, cnumcuota, 
CliNombre,dfecvenc, dfecpago, diaatr, cmoneda, PAG_TOTAL, mnt_cuota, saldo_cuota,
 pag_cuota, ninteres, traCod, OpeTipo, 
 cestado, idetletra, icodletra, 
 inumletra, cli_cod,ult
GO
/****** Object:  View [dbo].[list_letra]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[list_letra] (
valor ,numDoc, fac_acum,codPer, PrvRazon, 
FecEmesion, itotcuota, nmontocuota, pagpendiente, 
cmoneda, nintpag, estado, dfecultpago, fec_nxtpg
,icodletra, ctippago,PerCod,TraNombre
)
AS SELECT 
DISTINCT OP.OpeTipo AS valor, 
RIGHT('0000' + CONVERT(varchar, LT.icodigo), 4) AS numDoc,
(SELECT     COUNT(*) AS Expr1
FROM          dbo.DocumenOperacion AS dop
WHERE      (icodletra = LT.icodigo)) AS fac_acum, 
(case when OP.OpeTipo='C' then OP.PrvCod else OP.CliCod end)as codPer,
(case when OP.OpeTipo='C' then (select Pv.PrvRazon from Proveedores Pv where Pv.PrvCod = OP.PrvCod)
else (select CliNombre from Clientes cl where CliCod = OP.CliCod )end)  as PrvRazon, 
cast (LT.dfeccreacion as DATE) AS FecEmesion, 
LT.itotcuota,
LT.nmontocuota,
case when OP.OpeTipo='C'  then (SELECT     COALESCE (SUM(nmonto), 0.00) AS Expr1
FROM          dbo.det_letra AS dlt
WHERE      (icodletra = LT.icodigo) AND (cestado = '1')) 
else 
(LT.nmontocuota -(select coalesce (SUM(PL.nmonto) ,0)from Pag_letras  PL inner join det_letra DL on PL.idetletra = DL.idetletra where DL.icodletra=LT.icodigo)) end AS pagpendiente,
 LT.cmoneda, LT.nintpag, 
CASE WHEN [iestado] = '1' THEN 'PEND' WHEN [iestado] = '2' THEN 'CANC' WHEN [iestado] = '3' THEN 'CANC' END AS estado,
cast(LT.dfecultpago as date) AS dfecultpago, COALESCE
((SELECT     cast (MIN(dfecvenc) as date) AS Expr1
FROM         dbo.det_letra AS DL
WHERE     (LT.icodigo = icodletra) AND (cestado = '1')), NULL) AS fec_nxtpg,
 ISNULL(icodletra,-999) MyPrimaryID,
 ctippago , OP.PerCod, (select perNombres from Personal where perCod=OP.PerCod) as TraNombre
FROM         dbo.letra AS LT INNER JOIN
dbo.DocumenOperacion AS DO ON LT.icodigo = DO.icodletra 
INNER JOIN
dbo.Operaciones AS OP ON OP.OpeCod = DO.OpeCod
GO
/****** Object:  View [dbo].[vwList_let_detalle]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwList_let_detalle] (
numfac , dopFecEmision , OpeTotPagar , saldo , valor , numDoc , fac_acum , codPer , PrvRazon , FecEmesion , itotcuota , nmontocuota , pagpendiente , cmoneda , nintpag , estado , dfecultpago , fec_nxtpg , icodletra , ctippago , PerCod , TraNombre

)
AS
  select dopNroSerie+'-'+dopNumero as numdoc , dopFecEmision ,OpeTotPagar , OpeTotPagPen as saldo,LL.*
  from list_letra LL
  inner join DocumenOperacion DO on DO.icodletra= LL.icodletra
  inner join Operaciones OP on OP.OpeCod= DO.OpeCod
GO
/****** Object:  Table [dbo].[tbliqCobranza]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbliqCobranza](
	[idliqcob] [int] NOT NULL,
	[fecreg] [date] NULL,
	[fecmin] [date] NULL,
	[fecmax] [date] NULL,
	[efectivo] [numeric](10, 2) NULL,
	[ctaViatico] [numeric](10, 2) NULL,
	[depositos] [numeric](10, 2) NULL,
	[GastVarios] [numeric](10, 2) NULL,
	[cheques] [numeric](10, 2) NULL,
	[inefectivo] [numeric](10, 2) NULL,
	[efectivodol] [numeric](10, 2) NULL,
	[ctaViaticodol] [numeric](10, 2) NULL,
	[depositosdol] [numeric](10, 2) NULL,
	[GastVariosdol] [numeric](10, 2) NULL,
	[chequesdol] [numeric](10, 2) NULL,
	[inefectivodol] [numeric](10, 2) NULL,
	[observaciones] [text] NULL,
	[idrecibidor] [int] NULL,
	[totsoles] [numeric](10, 2) NULL,
	[totdolares] [numeric](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idliqcob] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[rolCod] [int] NOT NULL,
	[rolDescripcion] [varchar](50) NULL,
	[rolOpcionCrear] [bit] NULL,
	[rolOpcionModificar] [bit] NULL,
	[rolOpcionEliminar] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[rolCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Unidades]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidades](
	[UniCod] [int] NOT NULL,
	[UniDescripcion] [nvarchar](50) NULL,
	[UniAbrev] [nvarchar](15) NULL,
	[UniFactor] [numeric](18, 4) NULL,
	[UniSuperior] [int] NOT NULL,
	[UniEstado] [bit] NULL,
	[UniFecRegis] [datetime] NOT NULL,
 CONSTRAINT [PK_UNIDADES] PRIMARY KEY CLUSTERED 
(
	[UniCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion Recursiva' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Unidades', @level2type=N'COLUMN',@level2name=N'UniSuperior'
GO
/****** Object:  Table [dbo].[Ubigeos]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ubigeos](
	[UbiCod] [char](6) NOT NULL,
	[UbiDescripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_UBIGEOS] PRIMARY KEY CLUSTERED 
(
	[UbiCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[list_detLetra]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[list_detLetra] (
valor, dfecven, cuota, ccodletra, cnumletra, PrvRazon, estado, dfecpag, cmoneda, mnt_cuota, mnt_letra, Saldo_total, ninteres, PrvCod, cestado, icodletra, idetletra

)
AS

SELECT  OP.OpeTipo as valor
,[dfecvenc]as dfecven
,convert(varchar, inumletra) + ' de '+convert(varchar,(select MAX(inumletra) from [det_letra] SDE where SDE.icodletra = DE.icodletra)) as cuota
,[ccodletra]
,[cnumletra]
, PR.PrvRazon 
,case when [cestado]='1' then 'X Pagar' else 'Pagada' end as estado
,coalesce( CONVERT (nvarchar(30),[dfecpago], 111 )  ,'--')as dfecpag
,cmoneda 
,nmonto as mnt_cuota
,LE.nmontocuota as mnt_letra
,(select coalesce (sum(nmonto),0.00)  from det_letra SDE where SDE.icodletra= DE.icodletra  and cestado ='1') as Saldo_total
,[ninteres]
,OP.PrvCod 
,[cestado]
, DE.[icodletra]
,[idetletra]  
 
 FROM [Agrocomercio].[dbo].[det_letra] DE
 inner join DocumenOperacion DO on DE.icodletra = DO.icodletra 
 inner join Operaciones OP on OP.OpeCod = DO.OpeCod 
 inner join Proveedores PR on PR.PrvCod = OP.PrvCod 
 inner join letra LE on LE.icodigo = DE.icodletra
GO
/****** Object:  View [dbo].[fac_x_letra]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[fac_x_letra] (
icodletra, valor,dfecemision, dopCod, numfac, PrvRazon, opetotpagar, OpeTotal, PrvCod, monedas

)
AS
select icodletra, opetipo as valor,
cast (dopfecemision as date) as dfecemision, 
dopCod, dopNroSerie +'-'+ dopNumero as numfac,
case when OpeTipo ='C' then 
(select PrvRazon from Proveedores where PrvCod =  OP.PrvCod)
else 
(select CliNombre  from Clientes  where CliCod  =  OP.CliCod ) end as PrvRazon, 
opetotpagar , OpeTotal
, case when OpeTipo ='C' then 
OP.PrvCod else OP.CliCod  end as PrvCod,dopMoneda
from DocumenOperacion as DO
inner join Operaciones as OP on do.OpeCod= OP.OpeCod

where ((tdoCod in (2, 4) and OpeTipo='C') or (tdoCod in (3, 5) and OpeTipo='V'))  and icodletra is not null and OpeTipPago ='CR'
GO
/****** Object:  View [dbo].[cab_letra]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[cab_letra] (
valor,icodigo,numDoc,PrvRazon,FecEmesion,itotcuota,nmontocuota,opetotPagpen,cmoneda,nintpag,estado,dfecultpago,fec_nxtpg, ctippago

)
AS
SELECT distinct  OpeTipo as valor,  [icodigo] 
,dopNroSerie + '-'+ RIGHT('0000000000' + convert(varchar,dopNumero),10 ) as numDoc
,case when OpeTipo ='C' then 
(select PrvRazon from Proveedores where PrvCod =  OP.PrvCod)
else 
(select CliNombre  from Clientes  where CliCod  =  OP.CliCod ) end as PrvRazon,
CONVERT (nvarchar(30), dopFecEmision, 111 ) AS FecEmesion  
     ,[itotcuota]
     ,[nmontocuota]
     ,op.opetotPagpen
      ,[cmoneda]
     ,[nintpag]
     , case when [iestado]='1' then 'PEND'
when  [iestado]='2' then 'PAG-PAR'
when  [iestado]='3' then 'CANC'
end as estado
     ,CONVERT (nvarchar(30),dfecultpago, 111 ) AS dfecultpago
     ,coalesce ((select min(dfecvenc) from det_letra as DL where LT.icodigo = DL.icodletra and DL.cestado ='1') , NULL)as fec_nxtpg
    , ctippago
 FROM [Agrocomercio].[dbo].[letra] AS LT
 inner join DocumenOperacion AS DO on LT.icodigo = DO.icodletra
 INNER JOIN Operaciones AS OP ON OP.OpeCod = DO.OpeCod
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notas](
	[ccodnota] [char](10) NULL,
	[dfecreg] [datetime] NULL,
	[iprvcod] [int] NULL,
	[nmontoNota] [numeric](10, 2) NULL,
	[cestadoNota] [varchar](1) NULL,
	[nmntutilizado] [numeric](10, 2) NULL,
	[inota] [int] NOT NULL,
	[cobservaciones] [text] NULL,
	[ctipo] [varchar](1) NULL,
	[OpeMoneda] [char](3) NULL,
	[ctipNota] [varchar](2) NULL,
 CONSTRAINT [Notas_pk] PRIMARY KEY CLUSTERED 
(
	[inota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'fecha de registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'dfecreg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'codigo del provedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'iprvcod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'monto de la latra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'nmontoNota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'estado de la nota: P parcialmente pagado C cancelado N No Utilizada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'cestadoNota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'clave prikmaria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'inota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'te dice si la nota es para las compras o es para las ventas si es compra el campo iprvcod es del proveedor si es venta el campo iprvcod es el codigo del cleinte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'ctipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Moneda' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'OpeMoneda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tipo de nota de la tabla atributos codigo 9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'ctipNota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tabla de notas de credito como de debito' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas'
GO
/****** Object:  View [dbo].[proveedor_letra]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[proveedor_letra] (
tipo ,icodletra ,valor ,dfecemision ,dopCod ,numfac ,PrvRazon ,opetotpagar ,PrvCod ,CMONEDA ,ITOTCUOTA ,IESTADO ,mntletDol ,SalDol ,MNTLTSOL ,salsol
)
AS
  select tipo ,icodletra ,valor 
,dfecemision ,dopCod 
,numfac ,PrvRazon ,opetotpagar 
,PrvCod ,CMONEDA ,ITOTCUOTA ,
IESTADO , 
case when CMONEDA ='PEN' then 0.00 
else MNTLETRA end as mntletDol,
case when CMONEDA ='PEN' then 0.00 
else sALDO end as SalDol
, case when CMONEDA ='PEN' then MNTLETRA else convert(decimal(10,2),(MNTLETRA*(select convert(decimal(10,2), AtrDescripcion) from Atributos where AtrTipoCod =8)))
end as MNTLTSOL 
,case when CMONEDA ='PEN' then sALDO else convert(decimal(10,2),( sALDO*(select  convert(decimal(10,2), AtrDescripcion)  from Atributos where AtrTipoCod =8) ))end as salsol
 from (SELECT 'D' as tipo, [icodletra]
      ,[valor]
      ,[dfecemision]
      ,[dopCod]
      ,[numfac]
      ,[PrvRazon]
      ,[opetotpagar]
      ,[PrvCod]      
      ,'---' AS CMONEDA 
      ,'----------'  AS ITOTCUOTA
      ,'---' AS IESTADO
      ,NULL AS MNTLETRA
      , NULL AS sALDO
  FROM [Agrocomercio].[dbo].[fac_x_letra]
  
  UNION 
  select DISTINCT 'G' as tipo, [icodletra]
      ,[valor]
      ,NULL AS [dfecemision]
      ,NULL AS [dopCod]
      ,'----------' AS [numfac]
      ,[PrvRazon]
      ,NULL AS [opetotpagar]
      ,[PrvCod]
      ,CMONEDA 
      ,cast ((select COUNT (*) from det_letra where cestado =1 AND icodletra = FL.icodletra) AS  VARCHAR(10))+ ' de ' +  CAST(ITOTCUOTA as  VARCHAR(10)) as ITOTCUOTA
      ,cast (IESTADO as CHAR(1)) as IESTADO
      , NMONTOCUOTA AS MNTLETRA 
      , (SELECT SUM(nmonto) FROM det_letra WHERE cestado =1 AND icodletra = FL.icodletra) AS SALDO
      from fac_x_letra FL
      INNER JOIN letra LET ON FL.icodletra = LET.icodigo ) as A
      
     -- order by PrvRazon , tipo,dfecemision
GO
/****** Object:  View [dbo].[fac_pnd_let]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[fac_pnd_let] (
valor,dfecemision, dopCod, numfac, PrvRazon, opetotpagar,OpeTotal, PrvCod, monedas, percod, tranom

)
AS
SELECT    OP.OpeTipo AS valor, CAST(
DO.dopFecEmision as date) AS dfecemision, DO.dopCod, DO.dopNroSerie + '-' + DO.dopNumero AS numfac, 
                      CASE WHEN OpeTipo = 'C' THEN
                          (SELECT     PrvRazon
                            FROM          Proveedores
                            WHERE      PrvCod = OP.PrvCod) ELSE
                          (SELECT     CliNombre
                            FROM          Clientes
                            WHERE      CliCod = OP.CliCod) END AS PrvRazon, 
                            OP.OpeTotPagar, OP.opetotal,
                            CASE WHEN OpeTipo = 'C' THEN OP.PrvCod ELSE OP.CliCod END AS PrvCod
                            ,dopMoneda , OP.PerCod, (select perNombres from Personal where perCod=OP.PerCod) as TraNombre
FROM         dbo.DocumenOperacion AS DO INNER JOIN
                      dbo.Operaciones AS OP ON DO.OpeCod = OP.OpeCod
WHERE     ((DO.tdoCod IN (2, 4) AND OpeTipo ='C') OR (DO.tdoCod IN (3, 5) AND OpeTipo ='V') ) AND (DO.icodletra IS NULL) AND (OP.OpeTipPago = 'CR') and OP.OpeEstado ='P'
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulos](
	[ArtCod] [int] NOT NULL,
	[PrvCod] [int] NULL,
	[CodAnt] [varchar](10) NULL,
	[ArtDescripcion] [nvarchar](80) NOT NULL,
	[ArtStock] [numeric](18, 2) NOT NULL,
	[ArtStockFac] [numeric](18, 2) NOT NULL,
	[ArtCostoProm] [numeric](18, 2) NULL,
	[ArtStockMax] [numeric](18, 2) NULL,
	[ArtStockMin] [numeric](18, 2) NULL,
	[ArtPeso] [decimal](18, 18) NULL,
	[UniCod] [int] NULL,
	[ArtFecRegis] [date] NULL,
	[ArtFecModi] [date] NULL,
	[Artestado] [bit] NOT NULL,
	[ArtFecVen] [date] NULL,
 CONSTRAINT [PK_ARTICULOS] PRIMARY KEY CLUSTERED 
(
	[ArtCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rel_notfactura]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rel_notfactura](
	[idtpcod] [bigint] NULL,
	[inota] [int] NULL,
	[nmonto] [numeric](10, 2) NULL,
	[dfecmod] [datetime] NULL,
	[iusrcrc] [int] NULL,
	[irelnotfac] [int] NOT NULL,
 CONSTRAINT [rel_notfactura_pk] PRIMARY KEY CLUSTERED 
(
	[irelnotfac] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'llave foranea q relaciona la nota' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rel_notfactura', @level2type=N'COLUMN',@level2name=N'inota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'fecha de modificacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rel_notfactura', @level2type=N'COLUMN',@level2name=N'dfecmod'
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[usrCod] [int] NOT NULL,
	[perCod] [int] NULL,
	[usrLogin] [varchar](10) NULL,
	[usrClave] [varchar](10) NULL,
	[RolCod] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[usrCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaPrecios]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListaPrecios](
	[LprCod] [int] NOT NULL,
	[ArtCod] [int] NOT NULL,
	[LprFecRegis] [datetime] NULL,
	[LprPrecio] [numeric](18, 2) NULL,
	[LprDscto] [numeric](18, 2) NULL,
	[LprEstado] [bit] NOT NULL,
 CONSTRAINT [PK_LISTAPRECIOS] PRIMARY KEY CLUSTERED 
(
	[LprCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[rel_not_fact]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[rel_not_fact] (
inota,ccodnota,dfecreg,nmonto,dfecmod,iusrcrc ,irelnotfac,icodletra
)
AS

SELECT 
     RN.[inota]
     , ccodnota 
     , CONVERT (nvarchar(30), dfecreg , 111 ) AS dfecreg 
     ,[nmonto]
     ,[dfecmod]
     ,[iusrcrc]
     ,[irelnotfac]
     ,idtpcod 
 FROM [Agrocomercio].[dbo].[rel_notfactura]RN
 inner join Notas NT on RN.inota = NT.inota
GO
/****** Object:  View [dbo].[nota_list]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[nota_list](
valor, inota,ccodnota,FecEmesion,iprvcod,PrvRazon,nmontoNota,cestadoNota,nmntutilizado,estado, moneda, ctipNota, tiponota,cobservaciones
,letra
)
AS
SELECT ctipo as valor
,[inota]
     ,[ccodnota]
     ,cast ( NT.dfecreg as date)  AS FecEmesion  
     ,[iprvcod]
     ,case when ctipo ='C' then 
(select PrvRazon from Proveedores where PrvCod =  NT.[iprvcod])
else 
(select CliNombre  from Clientes  where CliCod  =  NT.[iprvcod] ) end as PrvRazon
     ,[nmontoNota]
     ,[cestadoNota]
     ,[nmntutilizado]
     , case 
 when cestadoNota = 'N' then 'Disponible' 
 when cestadoNota = 'C' then 'Utilizada' 
 else 'Parcialmente Utilizada'
     end 
     as estado
     ,OpeMoneda
     ,ctipNota
     ,(select AtrDescripcion from Atributos where AtrCodigo = ctipNota and AtrTipoCod =9) as tipNota
     ,cobservaciones
     ,(select idtpcod from rel_notfactura where inota= NT.inota) as icodletra
 FROM [Agrocomercio].[dbo].[Notas] as NT
GO
/****** Object:  View [dbo].[RepNotGen]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[RepNotGen] (

valor ,TIPO ,inota 
,ccodnota ,FecEmesion ,iprvcod 
,PrvRazon  ,cestadoNota  ,estado ,COD_LETRA 
,TOTFACT,nmntdolares,nmntsoles
, moneda

)
AS
SELECT [valor]
, (CASE WHEN [valor]='V' THEN 'NOT.DEBITO' ELSE 'NOT.CREDITO' END) AS TIPO
,NL.[inota]
,[ccodnota]
,cast ([FecEmesion] as date) as FecEmesion
,[iprvcod]
,[PrvRazon]
,[cestadoNota]
,[estado]
,[idtpcod] AS COD_LETRA           
,(SELECT COUNT(*) FROM DOCUMENOPERACION WHERE ICODLETRA = NF.[idtpcod]) AS TOTFACT
,case when moneda = 'USD' then nmontoNota else  0.00 end as nmntdolares 
,case when moneda = 'PEN' then nmontoNota else  0.00 end as nmntsoles
, moneda
--     ,[dfecmod]      
--      ,[irelnotfac]
FROM [Agrocomercio].[dbo].[nota_list] NL
LEFT JOIN rel_notfactura NF ON NL.inota=NF.inota
GO
/****** Object:  View [dbo].[RepNotDet]    Script Date: 03/23/2013 09:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[RepNotDet] (

valor ,TIPO ,inota 
,ccodnota ,FecEmesion ,iprvcod 
,PrvRazon  ,cestadoNota  ,estado ,COD_LETRA 
,factura,nmntdolares,nmntsoles,nmntdolutl,nmntsolutl,
 moneda

)
AS
SELECT [valor]
, (CASE WHEN [valor]='V' THEN 'NOT.DEBITO' ELSE 'NOT.CREDITO' END) AS TIPO
,NL.[inota]
,[ccodnota]
,cast ([FecEmesion] as date) as FecEmesion
,[iprvcod]
,[PrvRazon]
,[cestadoNota]
,[estado]
,[idtpcod] AS COD_LETRA           
,DO.dopNroSerie + '-'+DO.dopNumero as factura
,case when moneda = 'USD' then nmontoNota else  0.00 end as nmntdolares 
,case when moneda = 'PEN' then nmontoNota else  0.00 end as nmntsoles
,case when moneda = 'USD' then (select op.OpeTotal-op.OpeTotPagar from Operaciones op where op.OpeCod = DO.OpeCod) else  0.00 end as nmntdolutl 
,case when moneda = 'PEN' then (select op.OpeTotal-op.OpeTotPagar from Operaciones op where op.OpeCod = DO.OpeCod) else  0.00 end as nmntsolutl
, moneda
--     ,[dfecmod]      
--      ,[irelnotfac]
FROM [Agrocomercio].[dbo].[nota_list] NL
LEFT JOIN rel_notfactura NF ON NL.inota=NF.inota
left join DocumenOperacion DO on DO.icodletra = NF.idtpcod
GO
/****** Object:  Table [dbo].[LotesArt]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotesArt](
	[LotCod] [int] NOT NULL,
	[LotNro] [int] NOT NULL,
	[LprCod] [int] NOT NULL,
	[LotStock] [numeric](18, 2) NULL,
	[LotFecRegis] [date] NULL,
	[LotFecVenci] [date] NULL,
	[LotFecModi] [datetime] NULL,
	[LotEstado] [bit] NOT NULL,
 CONSTRAINT [PK_LotesArt] PRIMARY KEY CLUSTERED 
(
	[LotCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetOperacion]    Script Date: 03/23/2013 09:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetOperacion](
	[dtpCod] [bigint] NOT NULL,
	[OpeCod] [bigint] NOT NULL,
	[ArtCod] [int] NULL,
	[LotCod] [int] NULL,
	[dtpCantidad] [numeric](18, 2) NULL,
	[dtpPrecioVen] [numeric](18, 2) NULL,
	[dtpDscto] [numeric](18, 2) NULL,
	[dtpSubTotal] [numeric](18, 2) NULL,
	[UniCod] [int] NULL,
	[dtpEstado] [bit] NULL,
 CONSTRAINT [PK_DetOperacion] PRIMARY KEY CLUSTERED 
(
	[dtpCod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Clientes_CliFecRegis]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_CliFecRegis]  DEFAULT (getdate()) FOR [CliFecRegis]
GO
/****** Object:  Default [DF__det_letra__dfecm__4CA06362]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[det_letra] ADD  CONSTRAINT [DF__det_letra__dfecm__4CA06362]  DEFAULT (getdate()) FOR [dfecmod]
GO
/****** Object:  Default [DF__letra__ntotcuota__44FF419A]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[letra] ADD  CONSTRAINT [DF__letra__ntotcuota__44FF419A]  DEFAULT ((0)) FOR [itotcuota]
GO
/****** Object:  Default [DF__letra__cmoneda__46E78A0C]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[letra] ADD  CONSTRAINT [DF__letra__cmoneda__46E78A0C]  DEFAULT ('S') FOR [cmoneda]
GO
/****** Object:  Default [DF__letra__dfecmod__47DBAE45]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[letra] ADD  CONSTRAINT [DF__letra__dfecmod__47DBAE45]  DEFAULT (getdate()) FOR [dfecmod]
GO
/****** Object:  Default [DF__letra__ctippago__6D0D32F4]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[letra] ADD  CONSTRAINT [DF__letra__ctippago__6D0D32F4]  DEFAULT ('L') FOR [ctippago]
GO
/****** Object:  Default [DF__Notas__ctipo__6B24EA82]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Notas] ADD  CONSTRAINT [DF__Notas__ctipo__6B24EA82]  DEFAULT ('C') FOR [ctipo]
GO
/****** Object:  Default [DF__Operacion__nporD__60A75C0F]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Operaciones] ADD  DEFAULT ((0)) FOR [nporDesc]
GO
/****** Object:  Default [DF__rel_notfa__dfecm__534D60F1]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[rel_notfactura] ADD  CONSTRAINT [DF__rel_notfa__dfecm__534D60F1]  DEFAULT (getdate()) FOR [dfecmod]
GO
/****** Object:  Default [DF__TipoCambi__tcmFe__59FA5E80]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[TipoCambios] ADD  DEFAULT (getdate()) FOR [tcmFecha]
GO
/****** Object:  Default [DF_Unidades_UniFecRegis]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Unidades] ADD  CONSTRAINT [DF_Unidades_UniFecRegis]  DEFAULT (getdate()) FOR [UniFecRegis]
GO
/****** Object:  ForeignKey [FK_Articulos_Proveedores]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Proveedores] FOREIGN KEY([PrvCod])
REFERENCES [dbo].[Proveedores] ([PrvCod])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Proveedores]
GO
/****** Object:  ForeignKey [FK_ARTICULOS_UNIDADES]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_ARTICULOS_UNIDADES] FOREIGN KEY([UniCod])
REFERENCES [dbo].[Unidades] ([UniCod])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_ARTICULOS_UNIDADES]
GO
/****** Object:  ForeignKey [det_letra_fk]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[det_letra]  WITH CHECK ADD  CONSTRAINT [det_letra_fk] FOREIGN KEY([icodletra])
REFERENCES [dbo].[letra] ([icodigo])
GO
ALTER TABLE [dbo].[det_letra] CHECK CONSTRAINT [det_letra_fk]
GO
/****** Object:  ForeignKey [FK_det_letra_letra]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[det_letra]  WITH CHECK ADD  CONSTRAINT [FK_det_letra_letra] FOREIGN KEY([icodletra])
REFERENCES [dbo].[letra] ([icodigo])
GO
ALTER TABLE [dbo].[det_letra] CHECK CONSTRAINT [FK_det_letra_letra]
GO
/****** Object:  ForeignKey [FK_DetOperacion_Articulos]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[DetOperacion]  WITH CHECK ADD  CONSTRAINT [FK_DetOperacion_Articulos] FOREIGN KEY([ArtCod])
REFERENCES [dbo].[Articulos] ([ArtCod])
GO
ALTER TABLE [dbo].[DetOperacion] CHECK CONSTRAINT [FK_DetOperacion_Articulos]
GO
/****** Object:  ForeignKey [FK_DetOperacion_LotesArt]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[DetOperacion]  WITH CHECK ADD  CONSTRAINT [FK_DetOperacion_LotesArt] FOREIGN KEY([LotCod])
REFERENCES [dbo].[LotesArt] ([LotCod])
GO
ALTER TABLE [dbo].[DetOperacion] CHECK CONSTRAINT [FK_DetOperacion_LotesArt]
GO
/****** Object:  ForeignKey [FK_DetOperacion_Operaciones]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[DetOperacion]  WITH CHECK ADD  CONSTRAINT [FK_DetOperacion_Operaciones] FOREIGN KEY([OpeCod])
REFERENCES [dbo].[Operaciones] ([OpeCod])
GO
ALTER TABLE [dbo].[DetOperacion] CHECK CONSTRAINT [FK_DetOperacion_Operaciones]
GO
/****** Object:  ForeignKey [FK_DetOperacion_Unidades]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[DetOperacion]  WITH CHECK ADD  CONSTRAINT [FK_DetOperacion_Unidades] FOREIGN KEY([UniCod])
REFERENCES [dbo].[Unidades] ([UniCod])
GO
ALTER TABLE [dbo].[DetOperacion] CHECK CONSTRAINT [FK_DetOperacion_Unidades]
GO
/****** Object:  ForeignKey [FK_DocumenOperacion_Operaciones]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[DocumenOperacion]  WITH CHECK ADD  CONSTRAINT [FK_DocumenOperacion_Operaciones] FOREIGN KEY([OpeCod])
REFERENCES [dbo].[Operaciones] ([OpeCod])
GO
ALTER TABLE [dbo].[DocumenOperacion] CHECK CONSTRAINT [FK_DocumenOperacion_Operaciones]
GO
/****** Object:  ForeignKey [FK_LISTAPRECIOS_ARTICULOS]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[ListaPrecios]  WITH CHECK ADD  CONSTRAINT [FK_LISTAPRECIOS_ARTICULOS] FOREIGN KEY([ArtCod])
REFERENCES [dbo].[Articulos] ([ArtCod])
GO
ALTER TABLE [dbo].[ListaPrecios] CHECK CONSTRAINT [FK_LISTAPRECIOS_ARTICULOS]
GO
/****** Object:  ForeignKey [FK_LotesArt_ListaPrecios]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[LotesArt]  WITH CHECK ADD  CONSTRAINT [FK_LotesArt_ListaPrecios] FOREIGN KEY([LprCod])
REFERENCES [dbo].[ListaPrecios] ([LprCod])
GO
ALTER TABLE [dbo].[LotesArt] CHECK CONSTRAINT [FK_LotesArt_ListaPrecios]
GO
/****** Object:  ForeignKey [FK_Operaciones_Clientes]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_Clientes] FOREIGN KEY([CliCod])
REFERENCES [dbo].[Clientes] ([CliCod])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_Clientes]
GO
/****** Object:  ForeignKey [FK_Operaciones_Personal]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_Personal] FOREIGN KEY([PerCod])
REFERENCES [dbo].[Personal] ([perCod])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_Personal]
GO
/****** Object:  ForeignKey [FK_Operaciones_Proveedores]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_Proveedores] FOREIGN KEY([PrvCod])
REFERENCES [dbo].[Proveedores] ([PrvCod])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_Proveedores]
GO
/****** Object:  ForeignKey [FK_Operaciones_TipoCambios]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_TipoCambios] FOREIGN KEY([tcmCod])
REFERENCES [dbo].[TipoCambios] ([tcmCod])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_TipoCambios]
GO
/****** Object:  ForeignKey [FK_Operaciones_Transportistas]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Operaciones]  WITH CHECK ADD  CONSTRAINT [FK_Operaciones_Transportistas] FOREIGN KEY([TraCod])
REFERENCES [dbo].[Transportistas] ([TraCod])
GO
ALTER TABLE [dbo].[Operaciones] CHECK CONSTRAINT [FK_Operaciones_Transportistas]
GO
/****** Object:  ForeignKey [FK_Personal_TipoPersonal]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_TipoPersonal] FOREIGN KEY([tpecod])
REFERENCES [dbo].[TipoPersonal] ([tpeCod])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_TipoPersonal]
GO
/****** Object:  ForeignKey [rel_notfactura_fk2]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[rel_notfactura]  WITH CHECK ADD  CONSTRAINT [rel_notfactura_fk2] FOREIGN KEY([inota])
REFERENCES [dbo].[Notas] ([inota])
GO
ALTER TABLE [dbo].[rel_notfactura] CHECK CONSTRAINT [rel_notfactura_fk2]
GO
/****** Object:  ForeignKey [FK_Usuarios_Personal]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Personal] FOREIGN KEY([perCod])
REFERENCES [dbo].[Personal] ([perCod])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Personal]
GO
/****** Object:  ForeignKey [FK_Usuarios_Roles]    Script Date: 03/23/2013 09:10:37 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Roles] FOREIGN KEY([RolCod])
REFERENCES [dbo].[Roles] ([rolCod])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Roles]
GO



