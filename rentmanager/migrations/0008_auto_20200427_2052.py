# Generated by Django 3.0.5 on 2020-04-27 20:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('rentmanager', '0007_invoice'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='invoice',
            name='issue_date',
        ),
        migrations.AddField(
            model_name='invoice',
            name='created',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='invoice',
            name='name',
            field=models.CharField(choices=[('January', 'January'), ('February', 'February'), ('March', 'March'), ('April', 'April'), ('May', 'May'), ('June', 'June'), ('July', 'July'), ('August', 'August'), ('September', 'September'), ('October', 'October'), ('November', 'November'), ('December', 'December')], default='January', max_length=100),
        ),
        migrations.AddField(
            model_name='rentissue',
            name='name',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='invoice',
            name='electricity_bill',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='invoice',
            name='gas_bill',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='invoice',
            name='service_charge',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='invoice',
            name='water_bill',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='renter',
            name='name',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('payment_type', models.CharField(choices=[('Cash', 'Cash'), ('Cheque', 'Cheque')], max_length=50)),
                ('bank_name', models.CharField(blank=True, max_length=50)),
                ('cheque_number', models.CharField(blank=True, max_length=50)),
                ('paid_amount', models.IntegerField(default=0)),
                ('due_amount', models.IntegerField(blank=True, default=0)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('invoice', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rentmanager.Invoice')),
            ],
        ),
    ]