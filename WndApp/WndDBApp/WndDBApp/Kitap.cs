using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WndDBApp
{
    internal class Kitap
    {
        public int KitapID { get; set; }
        public string KitapAdi { get; set; }

        public int KategoriID { get; set; }
        public decimal Fiyat { get; set; }
    }
}
