using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using Npgsql;

namespace Proyecto_2_BD
{
    public partial class Login : Form
    {
        private static int idUsuarioActual;
        public Login()
        {
            InitializeComponent();
            maskedTextBox1.PasswordChar = '*';
        }

        private void Login_Load(object sender, EventArgs e)
        {

        }

        private void btningresar_Click(object sender, EventArgs e)
        {
            var connectionString = "Host=localhost;Username=diego;Password=admin;Database=proyecto02";
            string username = textBox1.Text;
            string password = maskedTextBox1.Text;

            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();

                using (var cmd = new NpgsqlCommand("SELECT * FROM verificar_usuario(@username, @password)", conn))
                {
                    cmd.Parameters.AddWithValue("username", username);
                    cmd.Parameters.AddWithValue("password", password);


                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int userId = reader.GetInt32(0);
                            string rol = reader.GetString(1);
                            bool habilitado = reader.GetBoolean(2);

                            if (habilitado)
                            {
                                idUsuarioActual = userId;
                                switch (rol)
                                {
                                    case "Médico":
                                        // Navegar a la ventana de médico
                                        this.Hide();
                                        Form ventanaMedico = new docs();
                                        ventanaMedico.Show();
                                        break;
                                    case "Administrador":
                                        // Navegar a la ventana de administrador
                                        this.Hide();
                                        Form ventanaAdministrador = new admin();
                                        ventanaAdministrador.Show();
                                        break;
                                    default:
                                        MessageBox.Show("El rol no es válido", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                        break;
                                }
                            }
                            else
                            {
                                MessageBox.Show("No puede ingresar porque su usuario está deshabilitado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            }
                        }
                        else
                        {
                            MessageBox.Show("El usuario o contraseña son incorrectos", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
        }

        public static int GetIdUsuarioActual()
        {
            return idUsuarioActual;
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            // Cambiar el carácter de enmascaramiento según el estado actual
            if (maskedTextBox1.PasswordChar != '*')
            {
                maskedTextBox1.PasswordChar = '*'; // Ocultar caracteres reales
                linkLabel1.Text = "Ver contraseña";
            }
            else
            {
                maskedTextBox1.PasswordChar = '\0'; // Mostrar caracteres reales
                linkLabel1.Text = "Ocultar contraseña";
                
            }
        }
    }
}
