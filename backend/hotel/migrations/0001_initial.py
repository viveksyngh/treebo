# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-10-02 04:43
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Deals',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('image', models.URLField(max_length=1000)),
                ('rating', models.FloatField(default=0)),
                ('link', models.URLField(max_length=1000)),
                ('actual_price', models.FloatField(default=0)),
                ('discount', models.PositiveIntegerField(default=0)),
                ('location', models.TextField(default='')),
            ],
        ),
    ]
