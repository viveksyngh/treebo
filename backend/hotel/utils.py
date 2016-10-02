from config import HOTELS_PER_PAGE


def sort_result(deals, sort_by):
    if sort_by == 'price':
        deals = deals.order_by('actual_price')
    elif sort_by == 'like':
        deals = deals.order_by('-likes')
    else:
        deals = deals.order_by('-rating')
    return deals


def slice_result(deals, page):
    start_index = (page - 1) * HOTELS_PER_PAGE 
    end_index = start_index + HOTELS_PER_PAGE
    return deals[start_index : end_index]

def get_sorted_and_sliced_deals(deals, page, sort_by):
    return slice_result(sort_result(deals, sort_by), page)
    
