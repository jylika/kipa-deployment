import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings")

import settings
import legacySettings 

from tupa.dia2django import luoMallienRungot
from django.core.management import execute_manager

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()