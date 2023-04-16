using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;

namespace Proyecto_2_BD
{
    public partial class newconsulta3 : Form
    {
        public newconsulta3()
        {
            InitializeComponent();
            dates2.Enabled = false;
            txtnewcon24.Enabled = false;
            txtnewcon25.Enabled = false;
        }

        private void newconsulta3_Load(object sender, EventArgs e)
        {

        }

        private void rbtnsi_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnsi.Checked)
            {
                dates2.Enabled = true;
                txtnewcon24.Enabled = true;
                txtnewcon25.Enabled = true;
            }
            else
            {
                // De lo contrario, deshabilitar los cuadros de texto
                dates2.Enabled = false;
                txtnewcon24.Enabled = false;
                txtnewcon25.Enabled = false;
            }
        }
    }
}
