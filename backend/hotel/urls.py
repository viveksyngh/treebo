from django.views.decorators.csrf import csrf_exempt
from django.conf.urls import url
from views import DealsView, StatsView, SearchView

urlpatterns = [
                url(r'list/',
                    csrf_exempt(DealsView.as_view())),
                url(r'stats/',
                    csrf_exempt(StatsView.as_view())),
                url(r'search/',
                    csrf_exempt(SearchView.as_view())),
]