object frmBookDetails: TfrmBookDetails
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1085#1080#1075#1077
  ClientHeight = 475
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 582
    Height = 438
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 24
    ExplicitWidth = 705
    ExplicitHeight = 217
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      DisabledIndex = 0
      Caption = 'Fb2 '#1080#1085#1092#1086
      ExplicitLeft = 4
      ExplicitTop = 23
      ExplicitWidth = 584
      ExplicitHeight = 441
      object Img: TImage
        Left = 8
        Top = 13
        Width = 201
        Height = 281
        Hint = #1054#1073#1083#1086#1078#1082#1072
        Center = True
        ParentShowHint = False
        Proportional = True
        ShowHint = True
        Stretch = True
      end
      object mmShort: TMemo
        Left = 8
        Top = 300
        Width = 560
        Height = 113
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object mmInfo: TMemo
        Left = 214
        Top = 13
        Width = 353
        Height = 281
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #1056#1077#1094#1077#1085#1079#1080#1103
      ExplicitTop = 21
      ExplicitWidth = 585
      ExplicitHeight = 441
      object mmReview: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 572
        Height = 372
        Margins.Bottom = 40
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = mmReviewChange
        ExplicitTop = 9
        ExplicitWidth = 573
        ExplicitHeight = 390
      end
      object btnClearReview: TRzBitBtn
        Left = 118
        Top = 384
        Width = 104
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 1
        Visible = False
        OnClick = btnClearReviewClick
        Kind = bkCancel
      end
      object btnLoadReview: TRzBitBtn
        Left = 8
        Top = 384
        Width = 104
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        TabOrder = 2
        Visible = False
        OnClick = btnLoadReviewClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00F1EF
          F000A49E9700DDD3CC00F5F0F000444250009E9DA5009E9B9D0028476A002F53
          77002B5B8C004E627A00E6E0D800E7E1DC00F0F0F000E7E2DD00E7EAF100D9DC
          E90088868600DEDFDF00F5EDE700423D4A00D3CCC700CFCBC900285482004386
          C60099B4CD0096AABE00D1CCC500D8D2CC00F0EDE800E2DDD800F7F4F100F7F1
          ED00B0ACA900DDDEDC00FBF5F100383F4200BCB3A700C9C3BF0021486B00527C
          9B00F0ECE600D2CAC400B9ADA400D3C9C200E7DDD500D5CCC400F5EFEA008E83
          7900CCC9C5008C887A00404E42001F3F3E002E454800393F43001A353E003D59
          5200BEB49F00E0D8CC003B4864009FA9D200F0F0EE00E5DFD900D8D4D4005465
          7D009194980038424100142347002A2D49003F3E530049485E0046466000383F
          6400504E7900DFD4C600526CA6005B7AC500A5A5B100E6E2DD005377B600435C
          8600746E7F0013155E003F3E6100978C8A00B7AFAD00C1B8B600BBB3B200AEA5
          A400837E87007F6E6A00435862002B4F8700788CB500E3DCD6003C6380008497
          A2003B385A0027405A007E797700CAC1C200D3C9C900D3C9C800D8CBCA00D3C9
          C800A3A0A20061667100465D54006B72790098979700B6AA9E0041665E007A8E
          7D00435752004A736B0097919200BBB6BD00C9C1C100CAC5C500A59D99009595
          9B00536CB400426CD800657AB100DAD0C700B0AAA400C0BEBB00738475006378
          6C0042594F0050777400A29C9E00A1A3AE008E93A60082899C004F5C7700375A
          A7004C80F0005C94FF006285DA00DFD6CA0097928D00F6F3F000EFEAE8005B7A
          7100486C61003A5E5B00838594006B78A500495C8500355EB4003F71D3005798
          FF0064A9FF005794FB00BABDCD00E5DFD90078787600E5E1DD0093A0B9007588
          99005A6E6E00475C70006783C800B7BCCE00A0A2A5002E54A4004776CF00628B
          C200879DBF00D0D1D500E6E2DF00E7E2DE00B9BAB900979290007A9AC1003D89
          E100407CC8004C619E006166B600A0B2DB008595C3003F62B800394B85005852
          5E00D2C0AC00D9D2CD00D9D4CF00DFD9D400F0EFE900B4ABA300849AA7004EAB
          FF0060CBFF0059A6F900826D9D003562B3002B4699002D50A0002F5AAF003A69
          B60087ACD000C3C2C200D8CEC400DBCFC700EFE4DA00D9D0C700E1DBD4006E93
          D60059A3EA005874A100645F83006A8FC300477FBE00558ABF005E90BF0086A5
          C700DBDEE300D5D0CA00E0D9D300DFD9D300F0F0E900E4DFD900988574006F6F
          F30056529D006F798800ACA9BC00C4A58C00999BA000C3A18300C5A88F00C5A2
          8400D6AD8A00C59E7C00C49C7A00C19A7700D1A78200C49C7B00626066007F81
          B600CBC2DE00AAE9DA00DFC0A300D6A77F00D5A88000D1A78100D2A78100D2A7
          8100E5B68D00D5AA8400D2A88200D2A88400E3B58E00D5AE8A00}
      end
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 438
    Width = 582
    Height = 37
    Align = alBottom
    BorderOuter = fsFlatBold
    TabOrder = 1
    ExplicitTop = 464
    ExplicitWidth = 585
    DesignSize = (
      582
      37)
    object RzBitBtn1: TRzBitBtn
      Left = 472
      Top = 6
      Width = 104
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = RzBitBtn1Click
      Kind = bkClose
      ExplicitLeft = 408
    end
  end
end
