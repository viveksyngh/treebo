from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Deals(models.Model):
    name = models.CharField(max_length=255)
    image = models.URLField(max_length=1000)
    rating = models.FloatField(default=0)
    link = models.URLField(max_length=1000)
    actual_price = models.FloatField(default=0)
    discount = models.PositiveIntegerField(default=0)
    location = models.TextField(default='')
    likes = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.name
    
    def _city(self):
        return self.location.split(',')[-2].strip()

    def _locality(self):
        location_list = self.location.split(',')
        locality = location_list[-3].strip()
        city = self._city()
        return locality + ', ' + city 

    def _final_price(self):
        final_price = 0
        if self.actual_price > 0:
            discount_amount = (self.actual_price * self.discount)/100
            final_price = self.actual_price - discount_amount
        return final_price

    @property
    def final_price(self):
        return self._final_price()
    
    @property
    def city(self):
        return self._city()

    @property
    def locality(self):
        return self._locality()
    
    

    def serialize(self):
        hotel = {}
        hotel["id"] = self.pk
        hotel["name"] = self.name
        hotel["image"] = self.image
        hotel["rating"] = self.rating
        hotel["link"] = self.link
        hotel["actual_price"] = self.actual_price
        hotel["discount"] = self.discount
        hotel["location"] = self.location
        hotel["final_price"] = self.final_price
        hotel["locality"] = self.locality
        hotel["like"] = self.likes
        return hotel 