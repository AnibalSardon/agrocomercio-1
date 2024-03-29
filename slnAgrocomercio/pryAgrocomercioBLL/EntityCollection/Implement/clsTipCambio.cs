﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using pryAgrocomercioDAL;
using pryAgrocomercioBLL.EntityCollection.Interfaces;

namespace pryAgrocomercioBLL.EntityCollection
{
    public class clsTipoCambios : clsAbstractBase<TipoCambios>, ITipoCambios
    {
        public clsTipoCambios()
            : base()
        {

        }

        public clsTipoCambios(AgrocomercioEntities _AgroEntity)
            : base(_AgroEntity)
        {

        }

        public TipoCambios GetLastTipoCambio(string _tcmMoneda)
        {
            TipoCambios oTipCam = new TipoCambios();
            try
            {
                oTipCam = this.Find(Tip => Tip.tcmMoneda == _tcmMoneda && (DateTime)Tip.tcmFecha <= DateTime.Today).
                    OrderByDescending(Tip => Tip.tcmfecmod).FirstOrDefault();
                if (oTipCam == null)
                {
                    if (_tcmMoneda == "PEN"){
                        oTipCam = new TipoCambios();
                        oTipCam.tcmCod = 0;
                        oTipCam.tcmCambio =1 ;
                        oTipCam.tcmFecha =  DateTime.Parse("2013-01-01");
                        oTipCam.tcmfecmod =  DateTime.Now;
                        oTipCam.tcmMoneda = _tcmMoneda; 
                        Add(oTipCam);
                        SaveChanges();
                        return oTipCam;
                    }                    
                    return null;
                }                    
                else
                    return oTipCam;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int MaxTcmCod()
        {
            var result = this.GetAll();
            if (result.Count() > 0)
            {
                return result.Max(Ti => Ti.tcmCod);
            }
            return 0;
        }
       
    }
}
