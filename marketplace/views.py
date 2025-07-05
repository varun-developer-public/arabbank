from django.shortcuts import render
from .models import Dataset, Category
from django.contrib.auth.decorators import login_required

def home_view(request):
    recent_datasets = Dataset.objects.order_by('-created_at')[:5]
    categories = Category.objects.all()
    return render(request, 'marketplace/home.html', {
        'recent_datasets': recent_datasets,
        'categories': categories,
    })
