# Generated by Django 5.0.6 on 2024-06-15 00:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('citas', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='tiposdocumentos',
            name='num_digitos',
            field=models.CharField(max_length=2, null=True),
        ),
    ]
