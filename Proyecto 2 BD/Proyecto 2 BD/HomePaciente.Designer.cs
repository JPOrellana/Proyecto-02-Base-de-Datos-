namespace Proyecto_2_BD
{
    partial class paciente
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.btnnewpaciente = new System.Windows.Forms.Button();
            this.btnresumen = new System.Windows.Forms.Button();
            this.pictureBox5 = new System.Windows.Forms.PictureBox();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnregresar2 = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox5)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.White;
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(255, -1);
            this.panel1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(214, 106);
            this.panel1.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft YaHei", 25.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.SteelBlue;
            this.label1.Location = new System.Drawing.Point(10, 30);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(186, 46);
            this.label1.TabIndex = 2;
            this.label1.Text = "Pacientes";
            // 
            // btnnewpaciente
            // 
            this.btnnewpaciente.Font = new System.Drawing.Font("Microsoft Tai Le", 13.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnnewpaciente.Location = new System.Drawing.Point(112, 245);
            this.btnnewpaciente.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnnewpaciente.Name = "btnnewpaciente";
            this.btnnewpaciente.Size = new System.Drawing.Size(110, 57);
            this.btnnewpaciente.TabIndex = 11;
            this.btnnewpaciente.Text = "Nuevo Paciente";
            this.btnnewpaciente.UseVisualStyleBackColor = true;
            this.btnnewpaciente.Click += new System.EventHandler(this.btnnewpaciente_Click);
            // 
            // btnresumen
            // 
            this.btnresumen.Font = new System.Drawing.Font("Microsoft Tai Le", 13.8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnresumen.Location = new System.Drawing.Point(256, 245);
            this.btnresumen.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnresumen.Name = "btnresumen";
            this.btnresumen.Size = new System.Drawing.Size(110, 57);
            this.btnresumen.TabIndex = 10;
            this.btnresumen.Text = "Resumen Paciente";
            this.btnresumen.UseVisualStyleBackColor = true;
            this.btnresumen.Click += new System.EventHandler(this.btnresumen_Click);
            // 
            // pictureBox5
            // 
            this.pictureBox5.BackgroundImage = global::Proyecto_2_BD.Properties.Resources.doc1;
            this.pictureBox5.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox5.ErrorImage = global::Proyecto_2_BD.Properties.Resources.log;
            this.pictureBox5.Location = new System.Drawing.Point(264, 133);
            this.pictureBox5.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.pictureBox5.Name = "pictureBox5";
            this.pictureBox5.Size = new System.Drawing.Size(94, 106);
            this.pictureBox5.TabIndex = 13;
            this.pictureBox5.TabStop = false;
            this.pictureBox5.Click += new System.EventHandler(this.pictureBox5_Click);
            // 
            // pictureBox3
            // 
            this.pictureBox3.BackgroundImage = global::Proyecto_2_BD.Properties.Resources.doc4;
            this.pictureBox3.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox3.ErrorImage = global::Proyecto_2_BD.Properties.Resources.log;
            this.pictureBox3.Location = new System.Drawing.Point(119, 133);
            this.pictureBox3.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(94, 106);
            this.pictureBox3.TabIndex = 12;
            this.pictureBox3.TabStop = false;
            this.pictureBox3.Click += new System.EventHandler(this.pictureBox3_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = global::Proyecto_2_BD.Properties.Resources._1;
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Location = new System.Drawing.Point(-2, -1);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(262, 106);
            this.pictureBox1.TabIndex = 2;
            this.pictureBox1.TabStop = false;
            // 
            // btnregresar2
            // 
            this.btnregresar2.Font = new System.Drawing.Font("Microsoft Tai Le", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnregresar2.Location = new System.Drawing.Point(368, 322);
            this.btnregresar2.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.btnregresar2.Name = "btnregresar2";
            this.btnregresar2.Size = new System.Drawing.Size(92, 31);
            this.btnregresar2.TabIndex = 19;
            this.btnregresar2.Text = "Regresar";
            this.btnregresar2.UseVisualStyleBackColor = true;
            this.btnregresar2.Click += new System.EventHandler(this.btnregresar2_Click);
            // 
            // paciente
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.CornflowerBlue;
            this.ClientSize = new System.Drawing.Size(469, 362);
            this.Controls.Add(this.btnregresar2);
            this.Controls.Add(this.pictureBox5);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.pictureBox3);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.btnnewpaciente);
            this.Controls.Add(this.btnresumen);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "paciente";
            this.Text = "Pacientes";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox5)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.PictureBox pictureBox5;
        private System.Windows.Forms.PictureBox pictureBox3;
        private System.Windows.Forms.Button btnnewpaciente;
        private System.Windows.Forms.Button btnresumen;
        private System.Windows.Forms.Button btnregresar2;
    }
}