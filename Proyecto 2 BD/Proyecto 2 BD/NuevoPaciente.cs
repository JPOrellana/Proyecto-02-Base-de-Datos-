using Npgsql;
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
    public partial class newpaciente : Form
    {
        private readonly string connectionString = "Host=localhost;Username=diego;Password=admin;Database=proyecto02";
        public newpaciente()
        {
            InitializeComponent();
            comboBox1.Items.Add("Masculino");
            comboBox1.Items.Add("Femenino");
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void newpaciente_Load(object sender, EventArgs e)
        {

        }

        private void btninsert1_Click(object sender, EventArgs e)

        {
            // Validar que todos los campos estén llenos y que los campos numéricos contengan solo números
            if (string.IsNullOrEmpty(txtdata1.Text) ||
                string.IsNullOrEmpty(txtdata2.Text) ||
                string.IsNullOrEmpty(txtdata3.Text) ||
                string.IsNullOrEmpty(txtdata4.Text) ||
                string.IsNullOrEmpty(txtdata5.Text) ||
                string.IsNullOrEmpty(txtdata6.Text) ||
                string.IsNullOrEmpty(txtdata7.Text))
            {
                MessageBox.Show("Por favor, complete todos los campos.");
            }
            else if (!int.TryParse(txtdata3.Text, out int edad) || !double.TryParse(txtdata6.Text, out double altura) || !double.TryParse(txtdata7.Text, out double peso))
            {
                MessageBox.Show("Por favor, ingrese valores numéricos válidos en los campos correspondientes.");
            }
            else
            {
                // Conectarse a la base de datos
                using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
                {
                    connection.Open();

                    // Crear un comando para insertar un nuevo paciente
                    using (NpgsqlCommand command = new NpgsqlCommand("SELECT insertar_paciente(@apellido_nombre, @edad, @sexo, @direccion, @telefono, @altura_m, @peso_kg, @enfermedades_hereditarias, @adicciones)", connection))
                    {
                        // Asignar los valores de los TextBox como parámetros de la consulta
                        command.Parameters.AddWithValue("@apellido_nombre",NpgsqlTypes.NpgsqlDbType.Varchar, txtdata1.Text + " " + txtdata2.Text);
                        command.Parameters.AddWithValue("@edad", NpgsqlTypes.NpgsqlDbType.Integer, int.Parse(txtdata3.Text));
                        command.Parameters.AddWithValue("@sexo", NpgsqlTypes.NpgsqlDbType.Varchar, comboBox1.SelectedItem.ToString());
                        command.Parameters.AddWithValue("@direccion", NpgsqlTypes.NpgsqlDbType.Varchar, txtdata4.Text);
                        command.Parameters.AddWithValue("@telefono", NpgsqlTypes.NpgsqlDbType.Varchar, txtdata5.Text);
                        command.Parameters.AddWithValue("@altura_m", NpgsqlTypes.NpgsqlDbType.Numeric, double.Parse(txtdata6.Text));
                        command.Parameters.AddWithValue("@peso_kg", NpgsqlTypes.NpgsqlDbType.Numeric, double.Parse(txtdata7.Text));
                        command.Parameters.AddWithValue("@enfermedades_hereditarias", NpgsqlTypes.NpgsqlDbType.Text, txtdata8.Text);
                        command.Parameters.AddWithValue("@adicciones", NpgsqlTypes.NpgsqlDbType.Text, txtdata9.Text);

                        // Ejecutar la consulta INSERT
                        int rowsAffected = command.ExecuteNonQuery();

                        // Verificar si se insertó correctamente el registro
                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("El paciente ha sido agregado correctamente.");
                        }
                        else
                        {
                            MessageBox.Show("Ocurrió un error al agregar el paciente.");
                        }
                    }
                }

                MessageBox.Show("Paciente Guardado");
            }
        }

        private void btnregresar3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form pacienteHome = new paciente();
            pacienteHome.Show();
        }
    }
}
