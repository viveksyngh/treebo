from django.shortcuts import render
from django.views.generic import View
from django.db.models import Sum, Avg
from collections import defaultdict
from treebo.response import send_200, send_400
from models import Deals
from config import HOTELS_PER_PAGE
from utils import get_sorted_and_sliced_deals
from django.db.models import Q

# Create your views here.


class DealsView(View):

	def __init__(self):
		self.response = {"message": "",
						  "result": {}
						}
	
	def dispatch(self, request, *args, **kwargs):
		return super(DealsView, self).dispatch(request, *args, **kwargs)

	def get(self, request, *args, **kwargs):
		page = request.GET.get("page")
		sort_by = request.GET.get('sort_by')
		try:
			page = int(page)
		except (ValueError, TypeError):
			self.response["message"] = "Invalid page id"
			return send_400(self.response)
		
		deals = Deals.objects.all()
		count = deals.count()
		current_page_deals = get_sorted_and_sliced_deals(deals, page, sort_by)
		hotels = []
		for deal in  current_page_deals:
			hotels.append(deal.serialize())
		self.response["message"] = "Deals recieved successfully."
		self.response["result"]["deals"] = hotels
		self.response['count'] = count
		return send_200(self.response)


class StatsView(View):
   
   	def __init__(self):
		self.response = {"message": "",
						  "result": {}
						}
	
	def dispatch(self, request, *args, **kwargs):
		return super(StatsView, self).dispatch(request, *args, **kwargs)

	def get(self, request, *args, **kwargs):
		deals = Deals.objects.all()
		total_likes = deals.aggregate(Sum('likes'))
		avg_rating = deals.aggregate(Avg('rating'))
		max_price = 0
		min_pirce = 2**32 - 1
		area_distribution_map = defaultdict(int)
		for deal in deals:
			area_distribution_map[deal.city] += 1
			max_price = max(max_price, deal.final_price)
			min_pirce = min(min_pirce, deal.final_price)
		self.response['result']['total_likes'] = total_likes['likes__sum']
		self.response['result']['avg_rating'] = round(avg_rating['rating__avg'], 1)
		self.response['result']['max_price'] = round(max_price)
		self.response['result']['min_price'] = round(min_pirce)
		self.response['result']['area_distribution'] = area_distribution_map
		self.response["message"] = "Success."
		return send_200(self.response)



class SearchView(View):

   	def __init__(self):
		self.response = {"message": "",
						  "result": {}
						}
	
	def dispatch(self, request, *args, **kwargs):
		return super(SearchView, self).dispatch(request, *args, **kwargs)

	def get(self, request, *args, **kwargs):
		query = request.GET.get('query')
		sort_by = request.GET.get('sort_by')
		page = request.GET.get('page')
		try:
			page = int(page)
		except (ValueError, TypeError):
			self.response["message"] = "Invalid page id"
			return send_400(self.response)

		deals = Deals.objects.filter(Q(name__icontains=query) | Q(location__icontains=query))
		count = deals.count()
		current_page_deals = get_sorted_and_sliced_deals(deals, page, sort_by)
		hotels = []
		for deal in  current_page_deals:
			hotels.append(deal.serialize())
		self.response["message"] = "Deals recieved successfully."
		self.response["result"]["deals"] = hotels
		self.response['count'] = count
		return send_200(self.response)


class LikeView(View):

   	def __init__(self):
		self.response = {"message": "",
						  "result": {}
						}
	
	def dispatch(self, request, *args, **kwargs):
		return super(LikeView, self).dispatch(request, *args, **kwargs)

	def post(self, request, *args, **kwargs):
		hotel_id = request.POST.get('hotel_id')
		try:
			hotel = Deals.objects.get(pk=hotel_id)
		except Deals.DoesNotExist:
			self.response["message"] = "Hotel does not exists."
			return send_400(self.response)
		else:
			hotel.likes += 1
			hotel.save()
			self.response["message"] = "Success"
		return send_200(self.response)


