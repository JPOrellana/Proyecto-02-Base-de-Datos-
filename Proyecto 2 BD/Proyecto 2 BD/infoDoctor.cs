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
    public partial class user : Form
    {
        

        public user()
        {
            InitializeComponent();
            var connectionString = "Host=localhost;Username=diego;Password=admin;Database=proyecto02";
            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();

                using (NpgsqlCommand command = new NpgsqlCommand("SELECT m.apellido_nombre, m.direccion, m.telefono, m.num_colegiado, e.nombre as especialidad, i.nombre as institucion_actual FROM medicos m JOIN especialidades e ON m.especialidad_id = e.especialidad_id JOIN historial_traslados ht ON m.num_colegiado = ht.id_medico AND ht.fecha_salida IS NULL JOIN instituciones i ON ht.id_institucion = i.institucion_id WHERE m.id_usuario = @id_usuario_actual", conn))
                {
                    command.Parameters.AddWithValue("id_usuario_actual", Login.GetIdUsuarioActual());
                    using (NpgsqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string nombres = reader.GetString(0);
                            string direccion = reader.GetString(1);
                            string telefono = reader.GetString(2);
                            int num_colegiado = reader.GetInt32(3);
                            string especialidad = reader.GetString(4);
                            string institucion_actual = reader.GetString(5);

                            lblusuario1.Text = nombres;
                            lblusuario3.Text = direccion;
                            lblusuario4.Text = telefono;
                            lblusuario5.Text = especialidad;
                            lblusuario6.Text = num_colegiado.ToString();
                            lblusuario2.Text = institucion_actual;
                        }
                    }
                }
            }

        }

        private void btnregresar1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form menu = new docs();
            menu.Show();
        }
    }
}
