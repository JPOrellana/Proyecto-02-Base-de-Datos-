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
    public partial class historial : Form
    {
        public historial()
        {
            InitializeComponent();
        }

        private void btnregresar5_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form paciente = new infopaciente();
            paciente.Show();
        }
    }
}
