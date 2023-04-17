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
    public partial class paciente : Form
    {
        public paciente()
        {
            InitializeComponent();
        }

        private void btnregresar2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form docMenu = new docs();
            docMenu.Show();
        }

        private void btnnewpaciente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form nuevoPaciente = new newpaciente();
            nuevoPaciente.Show();
        }

        private void btnresumen_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form paciente = new infopaciente();
            paciente.Show();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form nuevoPaciente = new newpaciente();
            nuevoPaciente.Show();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form paciente = new infopaciente();
            paciente.Show();
        }
    }
}
