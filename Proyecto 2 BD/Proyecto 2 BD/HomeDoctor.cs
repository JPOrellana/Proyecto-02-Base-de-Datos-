using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proyecto_2_BD
{
    public partial class docs : Form
    {
        public docs()
        {
            InitializeComponent();
            btncerrarsesion1.FlatStyle = FlatStyle.Flat;
            btncerrarsesion1.FlatAppearance.BorderSize = 0;
            btncerrarsesion1.TabStop = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
            Form ventanaLogin = new Login();
            ventanaLogin.Show();

        }

        private void docs_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form miusuario = new user();
            miusuario.Show();
        }

        private void btnusuario_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form miusuario = new user();
            miusuario.Show();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form miusuario = new paciente();
            miusuario.Show();
        }

        private void btnpaciente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form miusuario = new paciente();
            miusuario.Show();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form miusuario = new newconsulta1();
            miusuario.Show();
        }

        private void btnconsulta_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form miusuario = new newconsulta1();
            miusuario.Show();
        }
    }
}
