from django.http.response import JsonResponse
import json


def _send(data, status_code):
    return JsonResponse(data=data, status=status_code)


def send_200(data):
    return _send(data, 200)


def send_201(data):
    return _send(data, 201)


def send_400(data):
    return _send(data, 400)


def send_404(data):
    return _send(data, 404)
