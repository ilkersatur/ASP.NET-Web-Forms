using System.Data;
using System.Data.SqlClient;

namespace WndDBApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Urunler", "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\ISKUR\\02_01_2023\\WndApp\\WndDBApp\\WndDBApp\\Database\\DenemeDB.mdf;Integrated Security=True;Connect Timeout=30");

            DataTable dt = new DataTable();

            da.Fill(dt);

            dataGridView1.DataSource = dt;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Imzasý ve return type'ý ayný olan metodlarý taþýyan yapýlara temsilci denir....

            //Imza: Parametre sayýsý ve parametre tipi 

            //1- eventler
            //2- Lambda expression(LINQ)
            //3- CORE => Middleware 
            //4- Multi-thread uygulama yazarken

            List<int> sayilar = new List<int>() { 
            3,5,5657,67889,1,4};

            //sayilar.FindAll()
            //Action
            //Func

            // Cift sayýlarý bul? 
            // List<int> liste= sayilar.Where(x=>x %2 ==0).ToList<int>();

            //En buyuk sayidan kucuge dogru sirala
            //var liste = sayilar.OrderByDescending(x => x);

            var liste = sayilar.OrderBy(x => x);
            foreach (int item in liste)
                listBox1.Items.Add(item);

        }

        private void button3_Click(object sender, EventArgs e)
        {
            List<Kitap> kitaplar = new List<Kitap>() { 
            new Kitap{  KitapID=111, KitapAdi="Denemeler", Fiyat=55},
            new Kitap{  KitapID=101, KitapAdi="C++ Programlama", Fiyat=68},
            new Kitap{  KitapID=121, KitapAdi="Java", Fiyat=35}
            };

            var liste = kitaplar.OrderBy(x => x.KitapID);
            dataGridView1.DataSource = liste.ToList();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            List<Kategori> kategoriler = new List<Kategori>() { 
               new Kategori{ KategoriID=1, KategoriAdi="Deneme" },
               new Kategori{ KategoriID=2, KategoriAdi="Roman" },
               new Kategori{ KategoriID=3, KategoriAdi="Programlama" },
            }; 

            List<Kitap> kitaplar = new List<Kitap>() {
            new Kitap{  KitapID=111, KitapAdi="Denemeler", Fiyat=55, KategoriID=1},
            new Kitap{  KitapID=101, KitapAdi="C++ Programlama", Fiyat=68 , KategoriID=3},
            new Kitap{  KitapID=121, KitapAdi="Java", Fiyat=35, KategoriID=3}
            };

            //var result = from kitap in kitaplar
            //             join kategori in kategoriler
            //             on kitap.KategoriID equals kategori.KategoriID
            //             select new { kitap.KitapAdi, kategori.KategoriAdi, kitap.Fiyat  };
var result = kitaplar.Join(kategoriler, x => x.KategoriID, y => y.KategoriID, (x, y) => new { x.KitapAdi, y.KategoriAdi, x.Fiyat });

            dataGridView1.DataSource = result.ToList();
        }
    }
}