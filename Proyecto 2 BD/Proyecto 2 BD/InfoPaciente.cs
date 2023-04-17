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
    public partial class infopaciente : Form
    {
        public infopaciente()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form historialM = new historial();
            historialM.Show();
        }

        private void btnregresar4_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form pacienteHome = new paciente();
            pacienteHome.Show();
        }

        private void btnbuscar1_Click(object sender, EventArgs e)
        {

        }
    }
}
