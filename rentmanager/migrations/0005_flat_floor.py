# Generated by Django 3.0.5 on 2020-04-27 20:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rentmanager', '0004_auto_20200427_1951'),
    ]

    operations = [
        migrations.AddField(
            model_name='flat',
            name='floor',
            field=models.IntegerField(choices=[(1, '1'), (2, '2'), (3, '3'), (4, '4'), (5, '5'), (6, '6')], default=1),
        ),
    ]